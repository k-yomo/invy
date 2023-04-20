package main

import (
	"context"
	"crypto/tls"
	"fmt"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/k-yomo/invy/invy_api/handler"
	"github.com/k-yomo/invy/invy_api/service/chat_service"
	"github.com/k-yomo/invy/invy_api/service/notification_service"
	"github.com/k-yomo/invy/invy_api/service/user_service"
	"github.com/k-yomo/invy/pkg/cache"
	"github.com/redis/go-redis/v9"

	"ariga.io/sqlcomment"
	"cloud.google.com/go/profiler"
	gcs "cloud.google.com/go/storage"
	entsql "entgo.io/ent/dialect/sql"
	firebase "firebase.google.com/go/v4"
	firebaseAuth "firebase.google.com/go/v4/auth"
	gqlhandler "github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/XSAM/otelsql"
	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/k-yomo/invy/invy_api/ent"
	_ "github.com/k-yomo/invy/invy_api/ent/runtime"
	"github.com/k-yomo/invy/invy_api/graph"
	"github.com/k-yomo/invy/invy_api/graph/directive"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/config"
	"github.com/k-yomo/invy/invy_api/internal/device"
	"github.com/k-yomo/invy/invy_api/query"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/k-yomo/invy/pkg/storage"
	"github.com/k-yomo/invy/pkg/tracing"
	_ "github.com/lib/pq"
	"github.com/rs/cors"
	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	semconv "go.opentelemetry.io/otel/semconv/v1.4.0"
	"go.uber.org/zap"
	"google.golang.org/api/option"
)

const serviceName = "invy-api"

var (
	// version is set when docker image is built
	version string
)

func main() {
	ctx := context.Background()

	appConfig, err := config.NewAppConfig()
	if err != nil {
		panic(fmt.Sprintf("initialize app config failed: %v", err))
	}
	logger, err := logging.NewLogger(!appConfig.Env.IsDeployed(), serviceName, version)
	if err != nil {
		panic(fmt.Sprintf("initialize logger failed: %v", err))
	}

	if appConfig.Env.IsDeployed() {
		shutdown, err := tracing.InitTracer(ctx, serviceName)
		if err != nil {
			logger.Error("set trace provider failed", zap.Error(err))
		}
		defer func() { _ = shutdown(ctx) }()

		if err := profiler.Start(profiler.Config{}); err != nil {
			logger.Error("start profiler failed", zap.Error(err))
		}
	}

	db, err := otelsql.Open(
		config.DBDriver,
		appConfig.DBConfig.Dsn(),
		otelsql.WithAttributes(semconv.DBSystemPostgreSQL),
		otelsql.WithSpanOptions(otelsql.SpanOptions{OmitRows: true}),
	)
	if err != nil {
		logger.Fatal("initialize db failed", zap.Error(err))
	}
	defer db.Close()

	err = otelsql.RegisterDBStatsMetrics(db, otelsql.WithAttributes(
		semconv.DBSystemPostgreSQL,
	))
	if err != nil {
		logger.Fatal("register db stats metrics", zap.Error(err))
	}

	db.SetMaxOpenConns(10)
	db.SetMaxIdleConns(10)
	db.SetConnMaxLifetime(5 * time.Minute)
	bunDB := bun.NewDB(db, pgdialect.New())

	entDriver := sqlcomment.NewDriver(entsql.OpenDB(config.DBDriver, db),
		sqlcomment.WithDriverVerTag(),
		sqlcomment.WithTagger(sqlcomment.OTELTagger{}),
		sqlcomment.WithTags(sqlcomment.Tags{
			sqlcomment.KeyApplication: serviceName,
			sqlcomment.KeyFramework:   "net/http",
		}),
	)
	entDB := ent.NewClient(ent.Driver(entDriver))
	// Run migration.
	if err := entDB.Schema.Create(ctx); err != nil {
		logger.Fatal("creating schema resources failed", zap.Error(err))
	}

	redisOpts := &redis.Options{
		Addr:     appConfig.RedisConfig.Addr(),
		Password: appConfig.RedisConfig.Password,
	}
	if appConfig.Env.IsDeployed() {
		redisOpts.TLSConfig = &tls.Config{
			ServerName: appConfig.RedisConfig.URL,
			MinVersion: tls.VersionTLS12,
		}
	}
	redisClient := redis.NewClient(redisOpts)
	if err := redisClient.Ping(ctx).Err(); err != nil {
		logger.Fatal("initialize redis client failed", zap.Error(err))
	}
	defer redisClient.Close()

	firebaseApp, err := firebase.NewApp(
		ctx,
		&firebase.Config{ProjectID: appConfig.GCPProjectID},
		option.WithCredentialsFile(appConfig.FirebaseSecretKeyPath),
	)
	if err != nil {
		logger.Fatal("initializing firebase app failed", zap.Error(err))
	}

	firebaseAuthClient, err := firebaseApp.Auth(ctx)
	if err != nil {
		logger.Fatal("initializing firebase auth client failed", zap.Error(err))
	}
	firestoreClient, err := firebaseApp.Firestore(ctx)
	if err != nil {
		logger.Fatal("initializing firestore client failed", zap.Error(err))
	}
	fcmClient, err := firebaseApp.Messaging(ctx)
	if err != nil {
		logger.Fatal("initializing FCM client failed", zap.Error(err))
	}

	gcsClient, err := gcs.NewClient(context.Background())
	if err != nil {
		logger.Fatal("initialize gcs client failed", zap.Error(err))
	}
	defer gcsClient.Close()

	var avatarUploader storage.FileUploader
	var chatMessageImageUploader storage.FileUploader
	if appConfig.Env.IsDeployed() {
		avatarUploader = storage.NewGCSFileUploader(gcsClient, appConfig.GCSAvatarImageBucketName)
		chatMessageImageUploader = storage.NewGCSFileUploader(gcsClient, appConfig.GCSChatMessageImageBucketName)
	} else {
		// TODO: Don't use mock and use GCS for local development.
		avatarUploader = storage.NewMockFileUploader()
		chatMessageImageUploader = storage.NewMockFileUploader()
	}

	dbQuery := query.NewQuery(bunDB)

	userService := user_service.NewUserService(entDB)
	notificationService := notification_service.NewNotificationService(entDB, dbQuery, fcmClient)
	chatService := chat_service.NewChatService(
		firestoreClient,
		chatMessageImageUploader,
		appConfig.RootURL,
		userService,
		notificationService,
	)

	gqlConfig := gqlgen.Config{
		Resolvers: &graph.Resolver{
			DB:                  entDB,
			Cache:               cache.New(redisClient),
			DBQuery:             dbQuery,
			UserService:         userService,
			NotificationService: notificationService,
			ChatService:         chatService,
			FirebaseAuthClient:  firebaseAuthClient,
			AvatarUploader:      avatarUploader,
		},
		Directives: gqlgen.DirectiveRoot{
			AuthRequired: directive.AuthRequired,
			Constraint:   directive.Constraint,
		},
	}
	gqlServer := gqlhandler.NewDefaultServer(gqlgen.NewExecutableSchema(gqlConfig))
	gqlServer.SetErrorPresenter(graph.NewErrorPresenter())
	gqlServer.Use(tracing.GraphqlExtension{})
	gqlServer.Use(logging.GraphQLResponseInterceptor{})

	r := newBaseRouter(appConfig, logger, firebaseAuthClient)
	r.With(loader.Middleware(entDB)).Handle("/query", gqlServer)
	r.With(auth.RequireAuthMiddleware(firebaseAuthClient)).Route("/", func(r chi.Router) {
		chatImageHandler := handler.NewChatImageHandler(chatService, gcsClient, appConfig.GCSChatMessageImageBucketName)
		r.Get("/chatRooms/{chatRoomID}/images/{object}", chatImageHandler.HandleGetChatImage)
	})

	if appConfig.Env == config.EnvLocal {
		r.Get("/", playground.Handler("GraphQL playground", "/query"))
	}

	httpServer := &http.Server{Addr: fmt.Sprintf(":%d", appConfig.Port), Handler: r}
	go func() {
		logger.Info(fmt.Sprintf("server listening on port: %d", appConfig.Port))
		logger.Fatal(httpServer.ListenAndServe().Error())
	}()

	quitChan := make(chan os.Signal, 1)
	signal.Notify(quitChan, syscall.SIGTERM, os.Interrupt)
	logger.Info("Signal received, shutting down gracefully...", zap.Any("signal", <-quitChan))

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	if err := httpServer.Shutdown(ctx); err != nil {
		logger.Error("graceful shutdown failed", zap.Error(err))
	}
}

func newBaseRouter(appConfig *config.AppConfig, logger *zap.Logger, firebaseAuthClient *firebaseAuth.Client) *chi.Mux {
	r := chi.NewRouter()
	c := cors.New(cors.Options{
		AllowedOrigins:   appConfig.AllowedOrigins,
		AllowedHeaders:   []string{"X-Requested-By", "Origin", "Authorization", "Accept", "Content-Type"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowCredentials: true,
	})

	r.Use(c.Handler)
	r.Use(
		middleware.Recoverer,
		requestutil.Middleware,
		middleware.RealIP,
		tracing.HTTPMiddleware,
		logging.NewMiddleware(appConfig.GCPProjectID, logger),
		auth.Middleware(firebaseAuthClient),
		device.Middleware,
	)
	return r
}

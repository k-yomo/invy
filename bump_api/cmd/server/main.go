package main

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"cloud.google.com/go/profiler"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/k-yomo/bump/bump_api/config"
	"github.com/k-yomo/bump/bump_api/ent"
	"github.com/k-yomo/bump/bump_api/graph"
	"github.com/k-yomo/bump/bump_api/graph/gqlgen"
	"github.com/k-yomo/bump/bump_api/resthandler"
	"github.com/k-yomo/bump/bump_api/session"
	"github.com/k-yomo/bump/pkg/logging"
	"github.com/k-yomo/bump/pkg/requestid"
	"github.com/k-yomo/bump/pkg/tracing"
	_ "github.com/lib/pq"
	"github.com/markbates/goth"
	"github.com/markbates/goth/providers/line"
	"github.com/rs/cors"
	"go.uber.org/zap"
)

func main() {
	ctx := context.Background()

	appConfig, err := config.NewAppConfig()
	if err != nil {
		panic(fmt.Sprintf("initialize app config failed: %v", err))
	}
	logger, err := logging.NewLogger(!appConfig.Env.IsDeployed())
	if err != nil {
		panic(fmt.Sprintf("initialize logger failed: %v", err))
	}

	if appConfig.Env.IsDeployed() {
		shutdown, err := tracing.InitTracer()
		if err != nil {
			logger.Error("set trace provider failed", zap.Error(err))
		}
		defer func() { _ = shutdown(ctx) }()

		if err := profiler.Start(profiler.Config{}); err != nil {
			logger.Error("start profiler failed", zap.Error(err))
		}
	}

	dbClient, err := ent.Open(appConfig.DBConfig.Driver, appConfig.DBConfig.Dsn())
	if err != nil {
		logger.Fatal("initialize dbClient failed", zap.Error(err))
	}
	defer dbClient.Close()
	// Run migration.
	if err := dbClient.Schema.Create(ctx); err != nil {
		logger.Fatal("creating schema resources failed", zap.Error(err))
	}

	initOauthProviders(appConfig)
	sessionManager := session.NewManager(appConfig.RedisURL, appConfig.SessionCookieDomain, appConfig.Env.IsDeployed())
	gqlConfig := gqlgen.Config{
		Resolvers: &graph.Resolver{
			DBClient: dbClient,
		},
	}
	gqlServer := handler.NewDefaultServer(gqlgen.NewExecutableSchema(gqlConfig))
	// gqlServer.SetErrorPresenter(graph.NewErrorPresenter())
	gqlServer.Use(tracing.GraphqlExtension{})
	gqlServer.Use(logging.GraphQLResponseInterceptor{})

	r := newBaseRouter(appConfig, logger, sessionManager)
	r.Handle("/query", gqlServer)
	r.Route("/auth", func(r chi.Router) {
		authHandler := resthandler.NewAuthHandler(
			sessionManager,
			dbClient,
		)
		r.Get("/logout", authHandler.Logout)
		r.Get("/oauth/callback", authHandler.HandleOAuthCallback)
		r.Get("/oauth", authHandler.HandleOAuth)
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

func newBaseRouter(appConfig *config.AppConfig, logger *zap.Logger, sessionManager session.Manager) *chi.Mux {
	r := chi.NewRouter()
	c := cors.New(cors.Options{
		AllowedOrigins:   appConfig.AllowedOrigins,
		AllowedHeaders:   []string{"X-Requested-By", "Origin", "Authorization", "Accept", "Content-Type"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowCredentials: true,
	})

	r.Use(c.Handler)
	r.Use(
		requestid.Middleware,
		middleware.RealIP,
		middleware.Recoverer,
		logging.NewMiddleware(appConfig.GCPProjectID, logger),
		sessionManager.Middleware(),
	)
	return r
}

func initOauthProviders(appConfig *config.AppConfig) {
	lineProvider := line.New(appConfig.LineConfig.LineAuthClientKey, appConfig.LineConfig.LineAuthSecret, fmt.Sprintf("%s/auth/oauth/callback", appConfig.RootURL), "profile", "openid", "email")
	// To display the option to add your LINE Official Account as a friend
	// https://developers.line.biz/en/docs/line-login/link-a-bot/#redirect-users
	lineProvider.SetBotPrompt("aggressive")
	goth.UseProviders(lineProvider)
}

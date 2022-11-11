package session

import (
	"context"
	"errors"
	"net/http"
	"time"

	"github.com/alexedwards/scs/v2"
	"github.com/alexedwards/scs/v2/memstore"
	"github.com/k-yomo/bump/pkg/logging"
	"go.uber.org/zap"
)

const (
	cookieSessionKey = "sid"

	sessionUserIDKey = "user_id"
)

var UnauthenticatedErr = errors.New("unauthenticated")

//go:generate mockgen -source=$GOFILE -destination=../mocks/$GOPACKAGE/mock_$GOFILE -package=mock_$GOPACKAGE
type Manager interface {
	Middleware() func(next http.Handler) http.Handler

	Authenticate(ctx context.Context) error

	Login(ctx context.Context, userID string) error
	Logout(ctx context.Context) error

	GetUserID(ctx context.Context) string
}

type sessionManagerImpl struct {
	sessionManager *scs.SessionManager
}

type AuthenticatedUserInfo struct {
	ID           string
	Email        string
	DisplayName  string
	ScreenImgURL *string
}

// TODO: use redis cache
func NewManager(redisURL string, sessionCookieDomain string, secure bool) *sessionManagerImpl {
	// pool := &redis.Pool{
	// 	MaxIdle: 10,
	// 	Dial: func() (redis.Conn, error) {
	// 		return redis.Dial("tcp", redisURL)
	// 	},
	// }

	sessionManager := scs.New()
	sessionManager.Store = memstore.New()
	// sessionManager.Store = redisstore.New(pool)
	sessionManager.Lifetime = 24 * 365 * time.Hour // 1 year
	sessionManager.Cookie.Name = cookieSessionKey
	sessionManager.Cookie.Path = "/"
	sessionManager.Cookie.Domain = sessionCookieDomain
	sessionManager.Cookie.Secure = secure
	sessionManager.Cookie.HttpOnly = true
	sessionManager.Cookie.SameSite = http.SameSiteLaxMode

	sessionManager.ErrorFunc = func(w http.ResponseWriter, r *http.Request, err error) {
		logging.Logger(r.Context()).Error("error in sessionManager", zap.Error(err))
	}

	return &sessionManagerImpl{sessionManager: sessionManager}
}

func (s *sessionManagerImpl) Middleware() func(next http.Handler) http.Handler {
	return s.sessionManager.LoadAndSave
}

// Authenticate authenticates user
// session id must be set to context before
func (s *sessionManagerImpl) Authenticate(ctx context.Context) error {
	userID := s.sessionManager.GetString(ctx, sessionUserIDKey)
	if userID == "" {
		return UnauthenticatedErr
	}
	logging.AddFields(ctx, zap.String("userID", userID))
	return nil
}

func (s *sessionManagerImpl) Login(ctx context.Context, userID string) error {
	if err := s.sessionManager.RenewToken(ctx); err != nil {
		return err
	}

	s.sessionManager.Put(ctx, sessionUserIDKey, userID)
	logging.Logger(ctx).Info("Login Success", zap.String("userID", userID))

	return nil
}

func (s *sessionManagerImpl) Logout(ctx context.Context) error {
	return s.sessionManager.Clear(ctx)
}

func (s *sessionManagerImpl) GetUserID(ctx context.Context) string {
	return s.sessionManager.GetString(ctx, sessionUserIDKey)
}

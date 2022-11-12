package config

import (
	"fmt"

	"github.com/kelseyhightower/envconfig"
)

type Env string

const (
	EnvLocal = "local"
	EnvTest  = "test"
	EnvDev   = "dev"
	EnvProd  = "prod"
)

func (e Env) IsValid() bool {
	return map[Env]bool{EnvLocal: true, EnvTest: true, EnvDev: true, EnvProd: true}[e]
}

func (e Env) IsDeployed() bool {
	return e != EnvLocal && e != EnvTest
}

type AppConfig struct {
	Env                   Env      `default:"local" envconfig:"APP_ENV"`
	Port                  int      `default:"8000" envconfig:"PORT"`
	GCPProjectID          string   `default:"bump-platform-prod" envconfig:"GCP_PROJECT_ID"`
	FirebaseSecretKeyPath string   `envconfig:"FIREBASE_SECRET_KEY_PATH"`
	AllowedOrigins        []string `default:"http://localhost:3000,http://localhost:4000" envconfig:"ALLOWED_ORIGINS"`
	SessionCookieDomain   string   `default:"localhost" envconfig:"SESSION_COOKIE_DOMAIN"`
	RootURL               string   `default:"http://localhost:8000" envconfig:"ROOT_URL"`

	DBConfig   *DBConfig
	LineConfig *LineConfig
}

type DBConfig struct {
	Driver   string `default:"postgres"`
	DBName   string `default:"bump_db" envconfig:"DB_NAME"`
	User     string `default:"postgres" envconfig:"DB_USER"`
	Password string `default:"password" envconfig:"DB_PASSWORD"`
	// either one of DB_URL or DB_CONNECTION_NAME must be supplied
	DBURL          string `default:"localhost:15432" envconfig:"DB_URL"`
	ConnectionName string `envconfig:"DB_CONNECTION_NAME"`
}

type LineConfig struct {
	LineAuthClientKey string `envconfig:"LINE_AUTH_CLIENT_KEY"`
	LineAuthSecret    string `envconfig:"LINE_AUTH_SECRET"`

	LineMessageAccessToken string `envconfig:"LINE_MESSAGE_ACCESS_TOKEN"`
	LineMessageSecret      string `envconfig:"LINE_MESSAGE_SECRET"`
}

func NewAppConfig() (*AppConfig, error) {
	appConfig := &AppConfig{}
	if err := envconfig.Process("", appConfig); err != nil {
		return nil, err
	}
	if !appConfig.Env.IsValid() {
		return nil, fmt.Errorf("'%s' is invalid for env", appConfig.Env)
	}
	return appConfig, nil
}

func (d *DBConfig) Dsn() string {
	if d.ConnectionName != "" {
		return fmt.Sprintf("user=%s password=%s host=%s database=%s sslmode=disable", d.User, d.Password, d.ConnectionName, d.DBName)
	}
	return fmt.Sprintf("postgres://%s:%s@%s/%s?sslmode=disable", d.User, d.Password, d.DBURL, d.DBName)
}

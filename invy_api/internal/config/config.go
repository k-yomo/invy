package config

import (
	"fmt"
	"testing"

	"github.com/kelseyhightower/envconfig"
)

const DefaultAvatarURL = "https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png"

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
	Env                           Env      `default:"local" envconfig:"APP_ENV"`
	Port                          int      `default:"8000" envconfig:"PORT"`
	RootURL                       string   `default:"http://localhost:8000" envconfig:"ROOT_URL"`
	GCPProjectID                  string   `default:"invy-local" envconfig:"GCP_PROJECT_ID"`
	GCSAvatarImageBucketName      string   `envconfig:"GCS_AVATAR_IMAGE_BUCKET_NAME"`
	GCSChatMessageImageBucketName string   `envconfig:"GCS_CHAT_MESSAGE_IMAGE_BUCKET_NAME"`
	FirebaseSecretKeyPath         string   `envconfig:"FIREBASE_SECRET_KEY_PATH"`
	AllowedOrigins                []string `default:"http://localhost:3000,http://localhost:4000" envconfig:"ALLOWED_ORIGINS"`

	DBConfig    *DBConfig
	RedisConfig *RedisConfig
}

const (
	DBDriver   = "postgres"
	testDBName = "invy_test"
)

type DBConfig struct {
	DBName   string `default:"invy" envconfig:"DB_NAME"`
	User     string `default:"postgres" envconfig:"DB_USER"`
	Password string `default:"password" envconfig:"DB_PASSWORD"`
	// either one of DB_URL or DB_CONNECTION_NAME must be supplied
	URL            string `default:"localhost:15432" envconfig:"DB_URL"`
	ConnectionName string `envconfig:"DB_CONNECTION_NAME"`
}

type RedisConfig struct {
	URL      string `default:"localhost" envconfig:"REDIS_URL"`
	Port     string `default:"16379" envconfig:"REDIS_PORT"`
	Password string `default:"" envconfig:"REDIS_PASSWORD"`
}

func (r *RedisConfig) Addr() string {
	return fmt.Sprintf("%s:%s", r.URL, r.Port)
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

func NewDBConfig() (*DBConfig, error) {
	dbConfig := &DBConfig{}
	if err := envconfig.Process("", dbConfig); err != nil {
		return nil, err
	}
	return dbConfig, nil
}

func NewTestDBConfig(t *testing.T) (*DBConfig, error) {
	t.Helper()

	dbConfig, err := NewDBConfig()
	if err != nil {
		return nil, err
	}
	dbConfig.DBName = testDBName
	return dbConfig, nil
}

func (d *DBConfig) Dsn() string {
	if d.ConnectionName != "" {
		return fmt.Sprintf("user=%s password=%s host=%s database=%s sslmode=disable binary_parameters=yes", d.User, d.Password, d.ConnectionName, d.DBName)
	}
	return fmt.Sprintf("postgres://%s:%s@%s/%s?sslmode=disable&binary_parameters=yes", d.User, d.Password, d.URL, d.DBName)
}

package testutil

import (
	"context"
	"database/sql"
	"log"
	"testing"

	entsql "entgo.io/ent/dialect/sql"
	"github.com/DATA-DOG/go-txdb"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/internal/config"
	_ "github.com/lib/pq"
)

const testDBDriverName = "txdb"

func init() {
	dbConfig, err := config.NewTestDBConfig()
	if err != nil {
		log.Fatalf(err.Error())
	}

	txdb.Register(testDBDriverName, config.DBDriver, dbConfig.Dsn())

	entDB := NewTestEntDB(&testing.T{})
	// Run migration only once.
	if err := entDB.Schema.Create(context.Background()); err != nil {
		log.Fatalf("creating schema resources failed: %v", err)
	}
}

func NewTestDB(t *testing.T) *sql.DB {
	t.Helper()

	dbConfig, err := config.NewTestDBConfig()
	if err != nil {
		t.Fatalf("failed to get db config: %v", err)
	}

	sqldb, err := sql.Open(testDBDriverName, dbConfig.Dsn())
	if err != nil {
		t.Fatalf("failed to connect to DB: %v", err)
	}
	return sqldb
}

func NewTestEntDB(t *testing.T, opts ...ent.Option) *ent.Client {
	t.Helper()

	sqldb := NewTestDB(t)
	entDB := ent.NewClient(append(opts, ent.Driver(entsql.OpenDB(config.DBDriver, sqldb)))...)

	return entDB
}

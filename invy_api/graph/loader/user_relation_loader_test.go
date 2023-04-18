package loader

import (
	"context"
	"testing"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/testdata"
	"github.com/k-yomo/invy/invy_api/internal/testutil"
	"github.com/k-yomo/invy/pkg/pgutil"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestNewFriendGeoPointLoader(t *testing.T) {
	t.Parallel()

	t.Run("friend user's location is returned", func(t *testing.T) {
		t.Parallel()

		entDB := testutil.NewTestEntDB(t)
		defer entDB.Close()

		authUser := testdata.CreateUser(t, entDB)
		friendUser := testdata.CreateUser(t, entDB)
		testdata.CreateFriendship(t, entDB, authUser, friendUser)
		friendUserLocation := testdata.CreateUserLocation(t, entDB, friendUser)

		ctx := auth.SetUserIDForTest(t, context.Background(), authUser.ID)
		friendGeoPointLoader := NewFriendGeoPointLoader(entDB)
		results := friendGeoPointLoader(ctx, []uuid.UUID{friendUser.ID})

		assert.Equal(t, 1, len(results))
		assert.NoError(t, results[0].Error)

		assert.Equal(t, friendUserLocation.Coordinate.Lat(), results[0].Data.Lat())
		assert.Equal(t, friendUserLocation.Coordinate.Lon(), results[0].Data.Lon())
	})

	t.Run("friend user's location is not returned when blocked by the user", func(t *testing.T) {
		t.Parallel()

		entDB := testutil.NewTestEntDB(t)
		defer entDB.Close()

		authUser := testdata.CreateUser(t, entDB)
		friendUserWithBlock := testdata.CreateUser(t, entDB)
		friendUserLocation := testdata.CreateUserLocation(t, entDB, friendUserWithBlock)
		testdata.CreateFriendship(t, entDB, authUser, friendUserWithBlock)
		err := entDB.UserBlock.Create().
			SetUser(friendUserWithBlock).
			SetBlockUser(authUser).
			Exec(context.Background())
		require.NoError(t, err)

		ctx := auth.SetUserIDForTest(t, context.Background(), authUser.ID)
		friendGeoPointLoader := NewFriendGeoPointLoader(entDB)
		results := friendGeoPointLoader(ctx, []uuid.UUID{friendUserLocation.ID})
		require.Equal(t, 1, len(results))
		assert.NoError(t, results[0].Error)
		assert.Equal(t, (*pgutil.GeoPoint)(nil), results[0].Data)
	})

	t.Run("not friend user's location is not returned", func(t *testing.T) {
		t.Parallel()

		entDB := testutil.NewTestEntDB(t)
		defer entDB.Close()

		authUser := testdata.CreateUser(t, entDB)
		notFriendUser := testdata.CreateUser(t, entDB)
		testdata.CreateUserLocation(t, entDB, notFriendUser)

		ctx := auth.SetUserIDForTest(t, context.Background(), authUser.ID)
		friendGeoPointLoader := NewFriendGeoPointLoader(entDB)
		results := friendGeoPointLoader(ctx, []uuid.UUID{notFriendUser.ID})
		assert.Equal(t, 1, len(results))
		assert.NoError(t, results[0].Error)
		assert.Equal(t, (*pgutil.GeoPoint)(nil), results[0].Data)
	})
}

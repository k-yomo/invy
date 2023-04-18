package testdata

import (
	"context"
	"fmt"
	"testing"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/pkg/location"
	"github.com/k-yomo/invy/pkg/pgutil"
	"github.com/stretchr/testify/require"
)

func CreateAccount(t *testing.T, db *ent.Client) *ent.Account {
	t.Helper()

	id := uuid.New()
	email := fmt.Sprintf("%s@test.com", id)

	dbAccount, err := db.Account.Create().
		SetID(id).
		SetAuthID(uuid.New().String()).
		SetEmail(email).
		Save(context.Background())
	require.NoError(t, err)

	return dbAccount
}

func CreateUser(t *testing.T, db *ent.Client) *ent.User {
	t.Helper()

	account := CreateAccount(t, db)
	user, err := db.User.Create().
		SetAccount(account).
		Save(context.Background())
	require.NoError(t, err)

	user.Edges.Account = account
	account.Edges.Users = []*ent.User{user}
	return user
}

func CreateFriendship(t *testing.T, db *ent.Client, user1 *ent.User, user2 *ent.User) {
	t.Helper()

	err := db.Friendship.Create().
		SetUser(user1).
		SetFriendUser(user2).
		Exec(context.Background())
	if err != nil {
		t.Fatalf("failed to create friendship: %v", err)
	}
	err = db.Friendship.Create().
		SetUser(user2).
		SetFriendUser(user1).
		Exec(context.Background())
	require.NoError(t, err)
}

func CreateUserLocation(t *testing.T, db *ent.Client, user *ent.User) *ent.UserLocation {
	t.Helper()

	// Shibuya
	baseLat, baseLon := 35.6585663, 139.6980641
	lat, lon := location.GetRandomLocation(baseLat, baseLon, 10000)

	userLocation, err := db.UserLocation.Create().
		SetUser(user).
		SetCoordinate(pgutil.NewGeoPoint(lat, lon)).
		Save(context.Background())
	require.NoError(t, err)
	return userLocation
}

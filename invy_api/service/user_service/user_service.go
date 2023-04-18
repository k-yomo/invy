package user_service

import (
	"context"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
)

//go:generate $GOBIN/mockgen -source=$GOFILE -package=mock_$GOPACKAGE -destination=../../mocks/service/$GOPACKAGE/mock_$GOFILE
type UserService interface {
	GetUserProfile(ctx context.Context, userID uuid.UUID) (*ent.UserProfile, error)
}

type UserServiceImpl struct {
	db *ent.Client
}

func NewUserService(db *ent.Client) UserService {
	return &UserServiceImpl{
		db: db,
	}
}

func (u *UserServiceImpl) GetUserProfile(ctx context.Context, userID uuid.UUID) (*ent.UserProfile, error) {
	return u.db.UserProfile.Query().Where(userprofile.UserID(userID)).Only(ctx)
}

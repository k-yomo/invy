package invitation_service

import (
	"github.com/k-yomo/invy/invy_api/ent"
)

//go:generate $GOBIN/mockgen -source=$GOFILE -package=mock_$GOPACKAGE -destination=../../mocks/service/$GOPACKAGE/mock_$GOFILE
type InvitationService interface {
}

type InvitationServiceImpl struct {
	db *ent.Client
}

func NewInvitationService(db *ent.Client) InvitationService {
	return &InvitationServiceImpl{
		db: db,
	}
}

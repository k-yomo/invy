package query

import "github.com/uptrace/bun"

type invitationQuery struct {
	db *bun.DB
}

func newInvitationQuery(db *bun.DB) *invitationQuery {
	return &invitationQuery{db: db}
}

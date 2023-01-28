package query

import "github.com/uptrace/bun"

type Query struct {
	UserRelation *userRelationQuery
	Invitation   *invitationQuery
}

func NewQuery(db *bun.DB) *Query {
	return &Query{
		UserRelation: newUserRelationQuery(db),
		Invitation:   newInvitationQuery(db),
	}
}

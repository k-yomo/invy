package query

import "github.com/uptrace/bun"

type Query struct {
	UserRelation *userRelationQuery
	Invitation   *invitationQuery
	Notification *notificationQuery
}

func NewQuery(db *bun.DB) *Query {
	return &Query{
		UserRelation: newUserRelationQuery(db),
		Invitation:   newInvitationQuery(db),
		Notification: newNotificationQuery(db),
	}
}

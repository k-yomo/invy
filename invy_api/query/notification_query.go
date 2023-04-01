package query

import (
	"context"

	"github.com/cockroachdb/errors"
	"github.com/google/uuid"
	"github.com/uptrace/bun"
)

type notificationQuery struct {
	db *bun.DB
}

func newNotificationQuery(db *bun.DB) *notificationQuery {
	return &notificationQuery{db: db}
}

func (u *notificationQuery) GetNotifiableFriendUserPushTokens(
	ctx context.Context,
	userID uuid.UUID,
	friendUserIDs []uuid.UUID,
) ([]string, error) {
	if len(friendUserIDs) == 0 {
		return nil, nil
	}

	query := `
SELECT 
	pnt.fcm_token
FROM push_notification_tokens pnt
	JOIN users u ON u.id = pnt.user_id
WHERE
	u.id IN (?)
    AND u.id NOT IN (
    	SELECT user_id 
    	FROM user_blocks ub
    	WHERE
    	    block_user_id = ?
    )
    AND u.id NOT IN (
    	SELECT user_id 
    	FROM user_mutes um
    	WHERE
    	    mute_user_id = ?
    )
`
	var notifiableFriendUserPushTokens []string
	err := u.db.NewRaw(
		query,
		bun.In(friendUserIDs),
		userID,
		userID,
	).Scan(ctx, &notifiableFriendUserPushTokens)
	if err != nil {
		return nil, errors.Wrap(err, "notifiable friend user push tokens query")
	}
	return notifiableFriendUserPushTokens, nil
}

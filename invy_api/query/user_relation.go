package query

import (
	"context"

	"github.com/google/uuid"
	"github.com/uptrace/bun"
)

type userRelationQuery struct {
	db *bun.DB
}

func newUserRelationQuery(db *bun.DB) *userRelationQuery {
	return &userRelationQuery{db: db}
}

func (u *userRelationQuery) GetNotBlockedFriendUserIDs(
	ctx context.Context,
	userID uuid.UUID,
	friendUserIDs []uuid.UUID,
	friendGroupIDs []uuid.UUID,
) ([]uuid.UUID, error) {
	query := `
SELECT 
	u.id
FROM users u
	JOIN friendships f ON f.user_id = u.id AND f.friend_user_id = ?
WHERE
	(
	    u.id IN (?)
	    OR u.id IN (
	        SELECT 
	            user_id
	        FROM 
	            user_friend_groups
	        WHERE
	            friend_group_id IN (?)
	    )
	)
    AND u.id NOT IN (
    	SELECT user_id 
    	FROM user_blocks 
    	WHERE
    	    block_user_id = ?
    )
`
	var notBlockedFriendUserIDs []uuid.UUID
	err := u.db.NewRaw(query, userID, friendUserIDs, friendGroupIDs, userID).
		Scan(ctx, &notBlockedFriendUserIDs)
	if err != nil {
		return nil, err
	}
	return notBlockedFriendUserIDs, nil
}

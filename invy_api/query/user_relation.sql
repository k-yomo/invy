-- name: GetNotBlockedFriendUserIDs :many
SELECT
    u.id
FROM users u
    JOIN friendships f ON f.user_id = u.id AND f.friend_user_id = @user_id
WHERE
    (
        u.id = ANY(@friend_user_ids::uuid[])
        OR u.id IN (
            SELECT
                user_id
            FROM
                user_friend_groups
            WHERE
                friend_group_id = ANY(@friend_group_ids::uuid[])
        )
    )
    AND u.id NOT IN (
        SELECT user_id
        FROM user_blocks
        WHERE
            block_user_id = @user_id
    );
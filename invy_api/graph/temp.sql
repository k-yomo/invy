SELECT DISTINCT "user_locations"."id",
                "user_locations"."user_id",
                "user_locations"."coordinate",
                "user_locations"."updated_at"
FROM "user_locations"
         JOIN (SELECT "users"."user_user_location"
               FROM "users"
                        JOIN (SELECT "friendships"."friend_user_id"
                              FROM "friendships"
                              WHERE "friendships"."user_id" = '3d11ee74-d075-4dc0-a090-0ab7357c165d'
                                AND NOT EXISTS (SELECT *
                                                FROM "user_blocks"
                                                WHERE "user_blocks"."user_id" = "friendships"."friend_user_id"
                                                  AND "user_blocks"."block_user_id" = '3d11ee74-d075-4dc0-a090-0ab7357c165d')) AS "t1"
                             ON "users"."id" = "t1"."friend_user_id") AS "t1"
              ON "user_locations"."id" = "t1"."user_user_location"
WHERE "user_locations"."updated_at" >= '2023-04-18 21:41:57.204304 +0900 JST m=-7199.282364291'
package conv

import (
	"github.com/k-yomo/bump/bump_api/ent"
	"github.com/k-yomo/bump/bump_api/graph/gqlmodel"
)

func ConvertFromDBPageInfo(pageInfo *ent.PageInfo) *gqlmodel.PageInfo {
	return &gqlmodel.PageInfo{
		StartCursor:     pageInfo.StartCursor,
		EndCursor:       pageInfo.EndCursor,
		HasNextPage:     pageInfo.HasNextPage,
		HasPreviousPage: pageInfo.HasPreviousPage,
	}
}

func ConvertFromDBUserProfile(userProfile *ent.UserProfile) *gqlmodel.User {
	return &gqlmodel.User{
		ID:        userProfile.ID,
		Nickname:  userProfile.Nickname,
		AvatarURL: userProfile.AvatarURL,
	}
}

func ConvertFromDBFriendshipRequest(friendshipRequest *ent.FriendshipRequest) *gqlmodel.FriendshipRequest {
	return &gqlmodel.FriendshipRequest{
		ID:         friendshipRequest.ID,
		FromUserID: friendshipRequest.FromUserID,
		ToUserID:   friendshipRequest.ToUserID,
		CreatedAt:  friendshipRequest.CreatedAt,
	}
}

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

func ConvertFromDBUserProfileToViewer(userProfile *ent.UserProfile) *gqlmodel.Viewer {
	return &gqlmodel.Viewer{
		ID:        userProfile.UserID,
		Nickname:  userProfile.Nickname,
		AvatarURL: userProfile.AvatarURL,
	}
}

func ConvertFromDBUserProfile(userProfile *ent.UserProfile) *gqlmodel.User {
	return &gqlmodel.User{
		ID:        userProfile.UserID,
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

func ConvertFromDBFriendGroup(friendGroup *ent.FriendGroup) *gqlmodel.FriendGroup {
	return &gqlmodel.FriendGroup{
		ID:         friendGroup.ID,
		UserID:     friendGroup.UserID,
		Name:       friendGroup.Name,
		TotalCount: friendGroup.TotalCount,
	}
}

func ConvertFromDBInvitation(invitation *ent.Invitation) *gqlmodel.Invitation {
	return &gqlmodel.Invitation{
		ID:        invitation.ID,
		Location:  invitation.Location,
		Comment:   invitation.Comment,
		StartsAt:  invitation.StartsAt,
		ExpiresAt: invitation.ExpiresAt,
	}
}

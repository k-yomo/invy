package conv

import (
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
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
		ScreenID:  userProfile.ScreenID,
		Nickname:  userProfile.Nickname,
		AvatarURL: userProfile.AvatarURL,
	}
}

func ConvertFromDBUserProfile(userProfile *ent.UserProfile) *gqlmodel.User {
	return &gqlmodel.User{
		ID:        userProfile.UserID,
		ScreenID:  userProfile.ScreenID,
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
		ID:       invitation.ID,
		UserID:   invitation.UserID,
		Location: invitation.Location,
		Coordinate: &gqlmodel.Coordinate{
			Latitude:  invitation.Coordinate.Coords().Y(),
			Longitude: invitation.Coordinate.Coords().X(),
		},
		Comment:   invitation.Comment,
		StartsAt:  invitation.StartsAt,
		ExpiresAt: invitation.ExpiresAt,
	}
}

package conv

import (
	"fmt"

	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
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

func ConvertFromDBInvitation(invitation *ent.Invitation) (*gqlmodel.Invitation, error) {
	status, err := convertFromDBInvitationStatus(invitation.Status)
	if err != nil {
		return nil, err
	}

	var coordinate *gqlmodel.Coordinate
	if invitation.Coordinate != nil {
		coordinate = &gqlmodel.Coordinate{
			Latitude:  invitation.Coordinate.Coords().Y(),
			Longitude: invitation.Coordinate.Coords().X(),
		}
	}

	return &gqlmodel.Invitation{
		ID:         invitation.ID,
		Status:     status,
		UserID:     invitation.UserID,
		Location:   invitation.Location,
		Coordinate: coordinate,
		Comment:    invitation.Comment,
		StartsAt:   invitation.StartsAt,
		ExpiresAt:  invitation.ExpiresAt,
		ChatRoomID: invitation.ChatRoomID,
	}, nil
}

func convertFromDBInvitationStatus(status invitation.Status) (gqlmodel.InvitationStatus, error) {
	switch status {
	case invitation.StatusActive:
		return gqlmodel.InvitationStatusActive, nil
	case invitation.StatusClosed:
		return gqlmodel.InvitationStatusActive, nil
	default:
		return "", fmt.Errorf("unhandled invitation status: %s", status)
	}
}

func ConvertFromDBInvitationAwaiting(invitationAwaiting *ent.InvitationAwaiting) *gqlmodel.InvitationAwaiting {
	return &gqlmodel.InvitationAwaiting{
		ID:       invitationAwaiting.ID,
		UserID:   invitationAwaiting.UserID,
		StartsAt: invitationAwaiting.StartsAt,
		EndsAt:   invitationAwaiting.EndsAt,
		Comment:  invitationAwaiting.Comment,
	}
}

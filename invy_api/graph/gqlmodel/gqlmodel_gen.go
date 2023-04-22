// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package gqlmodel

import (
	"fmt"
	"io"
	"strconv"
	"time"

	"entgo.io/contrib/entgql"
	"github.com/99designs/gqlgen/graphql"
	"github.com/google/uuid"
)

type ChatMessageBody interface {
	IsChatMessageBody()
}

type Node interface {
	IsNode()
	GetID() uuid.UUID
}

type AcceptFriendshipRequestPayload struct {
	AcceptedFriendshipRequestID uuid.UUID `json:"acceptedFriendshipRequestId"`
}

type AcceptInvitationPayload struct {
	Invitation *Invitation `json:"invitation"`
}

type ActivateInvitationPayload struct {
	Invitation *Invitation `json:"invitation"`
}

type BlockUserPayload struct {
	BlockedUserID uuid.UUID `json:"blockedUserId"`
}

type CancelFriendshipRequestPayload struct {
	CanceledFriendshipRequestID uuid.UUID `json:"canceledFriendshipRequestId"`
}

type ChatMessage struct {
	ID         uuid.UUID       `json:"id"`
	ChatRoomID uuid.UUID       `json:"chatRoomId"`
	UserID     uuid.UUID       `json:"userId"`
	Kind       ChatMessageKind `json:"kind"`
	Body       ChatMessageBody `json:"body"`
	CreatedAt  time.Time       `json:"createdAt"`
}

func (ChatMessage) IsNode()               {}
func (this ChatMessage) GetID() uuid.UUID { return this.ID }

type ChatMessageBodyImage struct {
	URL string `json:"url"`
}

func (ChatMessageBodyImage) IsChatMessageBody() {}

type ChatMessageBodyText struct {
	Text string `json:"text"`
}

func (ChatMessageBodyText) IsChatMessageBody() {}

type ChatRoom struct {
	ID                 uuid.UUID              `json:"id"`
	ParticipantUserIds []uuid.UUID            `json:"participantUserIds"`
	Participants       []*ChatRoomParticipant `json:"participants"`
	CreatedAt          time.Time              `json:"createdAt"`
}

func (ChatRoom) IsNode()               {}
func (this ChatRoom) GetID() uuid.UUID { return this.ID }

type ChatRoomParticipant struct {
	UserID     uuid.UUID `json:"userId"`
	LastReadAt time.Time `json:"lastReadAt"`
}

type CloseInvitationPayload struct {
	Invitation *Invitation `json:"invitation"`
}

type Coordinate struct {
	Latitude  float64 `json:"latitude"`
	Longitude float64 `json:"longitude"`
}

type CreateFriendGroupInput struct {
	Name          string      `json:"name"`
	FriendUserIds []uuid.UUID `json:"friendUserIds"`
}

type CreateFriendGroupPayload struct {
	FriendGroup *FriendGroup `json:"friendGroup"`
}

type CreateUserInput struct {
	Nickname  string  `json:"nickname"`
	AvatarURL *string `json:"avatarUrl,omitempty"`
}

type CreateUserPayload struct {
	Viewer *Viewer `json:"viewer"`
}

type DeleteAccountPayload struct {
	DeletedAccountID uuid.UUID `json:"deletedAccountId"`
}

type DeleteFriendGroupPayload struct {
	DeletedFriendGroupID uuid.UUID `json:"deletedFriendGroupId"`
}

type DeleteInvitationPayload struct {
	DeletedInvitationID uuid.UUID `json:"deletedInvitationId"`
}

type DenyFriendshipRequestPayload struct {
	DeniedFriendshipRequestID uuid.UUID `json:"deniedFriendshipRequestId"`
}

type DenyInvitationPayload struct {
	Invitation *Invitation `json:"invitation"`
}

type FriendGroup struct {
	ID          uuid.UUID `json:"id"`
	UserID      uuid.UUID `json:"userId"`
	Name        string    `json:"name"`
	TotalCount  int       `json:"totalCount"`
	FriendUsers []*User   `json:"friendUsers"`
}

func (FriendGroup) IsNode()               {}
func (this FriendGroup) GetID() uuid.UUID { return this.ID }

type FriendshipRequest struct {
	ID         uuid.UUID `json:"id"`
	FromUserID uuid.UUID `json:"fromUserId"`
	FromUser   *User     `json:"fromUser"`
	ToUserID   uuid.UUID `json:"toUserId"`
	ToUser     *User     `json:"toUser"`
	CreatedAt  time.Time `json:"createdAt"`
}

func (FriendshipRequest) IsNode()               {}
func (this FriendshipRequest) GetID() uuid.UUID { return this.ID }

type GetMinRequiredAppVersionPayload struct {
	MinRequiredAppVersion string `json:"minRequiredAppVersion"`
}

type Invitation struct {
	ID            uuid.UUID        `json:"id"`
	Status        InvitationStatus `json:"status"`
	UserID        uuid.UUID        `json:"userId"`
	User          *User            `json:"user"`
	Location      string           `json:"location"`
	Coordinate    *Coordinate      `json:"coordinate,omitempty"`
	Comment       string           `json:"comment"`
	StartsAt      time.Time        `json:"startsAt"`
	ExpiresAt     time.Time        `json:"expiresAt"`
	ChatRoomID    *uuid.UUID       `json:"chatRoomId,omitempty"`
	ChatRoom      *ChatRoom        `json:"chatRoom,omitempty"`
	AcceptedUsers []*User          `json:"acceptedUsers"`
	DeniedUsers   []*User          `json:"deniedUsers"`
	IsAccepted    bool             `json:"isAccepted"`
}

func (Invitation) IsNode()               {}
func (this Invitation) GetID() uuid.UUID { return this.ID }

type MuteUserPayload struct {
	MutedUserID uuid.UUID `json:"mutedUserId"`
}

type PageInfo struct {
	StartCursor     *entgql.Cursor[uuid.UUID] `json:"startCursor,omitempty"`
	EndCursor       *entgql.Cursor[uuid.UUID] `json:"endCursor,omitempty"`
	HasNextPage     bool                      `json:"hasNextPage"`
	HasPreviousPage bool                      `json:"hasPreviousPage"`
}

type RegisterPushNotificationTokenInput struct {
	DeviceID string `json:"deviceId"`
	FcmToken string `json:"fcmToken"`
}

type RegisterPushNotificationTokenPayload struct {
	RegisteredPushNotificationTokenID uuid.UUID `json:"registeredPushNotificationTokenId"`
}

type RequestFriendshipPayload struct {
	FriendShipRequest *FriendshipRequest `json:"friendShipRequest"`
}

type SendChatMessageImageInput struct {
	ID         uuid.UUID      `json:"id"`
	ChatRoomID uuid.UUID      `json:"chatRoomId"`
	Image      graphql.Upload `json:"image"`
}

type SendChatMessageImagePayload struct {
	ChatMessage *ChatMessage `json:"chatMessage"`
}

type SendChatMessageTextInput struct {
	ID         uuid.UUID `json:"id"`
	ChatRoomID uuid.UUID `json:"chatRoomId"`
	Text       string    `json:"text"`
}

type SendChatMessageTextPayload struct {
	ChatMessage *ChatMessage `json:"chatMessage"`
}

type SendInvitationInput struct {
	TargetFriendGroupIds []uuid.UUID `json:"targetFriendGroupIds"`
	TargetFriendUserIds  []uuid.UUID `json:"targetFriendUserIds"`
	ExpiresAt            *time.Time  `json:"expiresAt,omitempty"`
	StartsAt             time.Time   `json:"startsAt"`
	Location             string      `json:"location"`
	Latitude             *float64    `json:"latitude,omitempty"`
	Longitude            *float64    `json:"longitude,omitempty"`
	Comment              string      `json:"comment"`
}

type SendInvitationPayload struct {
	Invitation *Invitation `json:"invitation"`
}

type SignOutPayload struct {
	SignedOutUserID uuid.UUID `json:"signedOutUserId"`
}

type SignUpInput struct {
	Email     *string         `json:"email,omitempty"`
	Nickname  *string         `json:"nickname,omitempty"`
	AvatarURL *string         `json:"avatarUrl,omitempty"`
	Avatar    *graphql.Upload `json:"avatar,omitempty"`
}

type SignUpPayload struct {
	Viewer *Viewer `json:"viewer"`
}

type SwitchUserPayload struct {
	Viewer *Viewer `json:"viewer"`
}

type UnblockUserPayload struct {
	UnblockedUserID uuid.UUID `json:"unblockedUserId"`
}

type UnmuteUserPayload struct {
	UnmutedUserID uuid.UUID `json:"unmutedUserId"`
}

type UpdateAvatarPayload struct {
	Viewer *Viewer `json:"viewer"`
}

type UpdateChatLastReadAtInput struct {
	ChatRoomID uuid.UUID `json:"chatRoomId"`
	LastReadAt time.Time `json:"lastReadAt"`
}

type UpdateChatLastReadAtPayload struct {
	ChatRoomID uuid.UUID `json:"chatRoomId"`
}

type UpdateFriendGroupInput struct {
	ID            uuid.UUID   `json:"id"`
	Name          string      `json:"name"`
	FriendUserIds []uuid.UUID `json:"friendUserIds"`
}

type UpdateFriendGroupPayload struct {
	FriendGroup *FriendGroup `json:"friendGroup"`
}

type UpdateLocationPayload struct {
	UpdatedUserLocationID uuid.UUID `json:"updatedUserLocationId"`
}

type UpdateNicknamePayload struct {
	Viewer *Viewer `json:"viewer"`
}

type UpdateScreenIDPayload struct {
	Viewer *Viewer `json:"viewer"`
}

type User struct {
	ID                     uuid.UUID   `json:"id"`
	ScreenID               string      `json:"screenId"`
	Nickname               string      `json:"nickname"`
	AvatarURL              string      `json:"avatarUrl"`
	IsMuted                bool        `json:"isMuted"`
	IsBlocked              bool        `json:"isBlocked"`
	IsFriend               bool        `json:"isFriend"`
	FuzzyCoordinate        *Coordinate `json:"fuzzyCoordinate,omitempty"`
	DistanceKm             *int        `json:"distanceKm,omitempty"`
	IsRequestingFriendship bool        `json:"isRequestingFriendship"`
}

func (User) IsNode()               {}
func (this User) GetID() uuid.UUID { return this.ID }

type UserConnection struct {
	Edges      []*UserEdge `json:"edges"`
	PageInfo   *PageInfo   `json:"pageInfo"`
	TotalCount int         `json:"totalCount"`
}

type UserEdge struct {
	Node   *User                    `json:"node"`
	Cursor entgql.Cursor[uuid.UUID] `json:"cursor"`
}

type Viewer struct {
	ID                           uuid.UUID            `json:"id"`
	ScreenID                     string               `json:"screenId"`
	Nickname                     string               `json:"nickname"`
	AvatarURL                    string               `json:"avatarUrl"`
	Friends                      *UserConnection      `json:"friends"`
	BlockedFriends               *UserConnection      `json:"blockedFriends"`
	PendingFriendshipRequests    []*FriendshipRequest `json:"pendingFriendshipRequests"`
	RequestingFriendshipRequests []*FriendshipRequest `json:"requestingFriendshipRequests"`
	FriendGroup                  *FriendGroup         `json:"friendGroup"`
	FriendGroups                 []*FriendGroup       `json:"friendGroups"`
	SentInvitations              []*Invitation        `json:"sentInvitations"`
	PendingInvitations           []*Invitation        `json:"pendingInvitations"`
	AcceptedInvitations          []*Invitation        `json:"acceptedInvitations"`
}

func (Viewer) IsNode()               {}
func (this Viewer) GetID() uuid.UUID { return this.ID }

type ChatMessageKind string

const (
	ChatMessageKindText  ChatMessageKind = "TEXT"
	ChatMessageKindImage ChatMessageKind = "IMAGE"
)

var AllChatMessageKind = []ChatMessageKind{
	ChatMessageKindText,
	ChatMessageKindImage,
}

func (e ChatMessageKind) IsValid() bool {
	switch e {
	case ChatMessageKindText, ChatMessageKindImage:
		return true
	}
	return false
}

func (e ChatMessageKind) String() string {
	return string(e)
}

func (e *ChatMessageKind) UnmarshalGQL(v interface{}) error {
	str, ok := v.(string)
	if !ok {
		return fmt.Errorf("enums must be strings")
	}

	*e = ChatMessageKind(str)
	if !e.IsValid() {
		return fmt.Errorf("%s is not a valid ChatMessageKind", str)
	}
	return nil
}

func (e ChatMessageKind) MarshalGQL(w io.Writer) {
	fmt.Fprint(w, strconv.Quote(e.String()))
}

type ConstraintFormat string

const (
	ConstraintFormatEmail ConstraintFormat = "EMAIL"
	ConstraintFormatURL   ConstraintFormat = "URL"
)

var AllConstraintFormat = []ConstraintFormat{
	ConstraintFormatEmail,
	ConstraintFormatURL,
}

func (e ConstraintFormat) IsValid() bool {
	switch e {
	case ConstraintFormatEmail, ConstraintFormatURL:
		return true
	}
	return false
}

func (e ConstraintFormat) String() string {
	return string(e)
}

func (e *ConstraintFormat) UnmarshalGQL(v interface{}) error {
	str, ok := v.(string)
	if !ok {
		return fmt.Errorf("enums must be strings")
	}

	*e = ConstraintFormat(str)
	if !e.IsValid() {
		return fmt.Errorf("%s is not a valid ConstraintFormat", str)
	}
	return nil
}

func (e ConstraintFormat) MarshalGQL(w io.Writer) {
	fmt.Fprint(w, strconv.Quote(e.String()))
}

type ErrorCode string

const (
	ErrorCodeInvalidArgument ErrorCode = "INVALID_ARGUMENT"
	ErrorCodeUnauthenticated ErrorCode = "UNAUTHENTICATED"
	ErrorCodeForbidden       ErrorCode = "FORBIDDEN"
	ErrorCodeNotFound        ErrorCode = "NOT_FOUND"
	ErrorCodeAlreadyExists   ErrorCode = "ALREADY_EXISTS"
	ErrorCodeConflict        ErrorCode = "CONFLICT"
	ErrorCodeInternal        ErrorCode = "INTERNAL"
)

var AllErrorCode = []ErrorCode{
	ErrorCodeInvalidArgument,
	ErrorCodeUnauthenticated,
	ErrorCodeForbidden,
	ErrorCodeNotFound,
	ErrorCodeAlreadyExists,
	ErrorCodeConflict,
	ErrorCodeInternal,
}

func (e ErrorCode) IsValid() bool {
	switch e {
	case ErrorCodeInvalidArgument, ErrorCodeUnauthenticated, ErrorCodeForbidden, ErrorCodeNotFound, ErrorCodeAlreadyExists, ErrorCodeConflict, ErrorCodeInternal:
		return true
	}
	return false
}

func (e ErrorCode) String() string {
	return string(e)
}

func (e *ErrorCode) UnmarshalGQL(v interface{}) error {
	str, ok := v.(string)
	if !ok {
		return fmt.Errorf("enums must be strings")
	}

	*e = ErrorCode(str)
	if !e.IsValid() {
		return fmt.Errorf("%s is not a valid ErrorCode", str)
	}
	return nil
}

func (e ErrorCode) MarshalGQL(w io.Writer) {
	fmt.Fprint(w, strconv.Quote(e.String()))
}

type InvitationStatus string

const (
	InvitationStatusActive InvitationStatus = "ACTIVE"
	InvitationStatusClosed InvitationStatus = "CLOSED"
)

var AllInvitationStatus = []InvitationStatus{
	InvitationStatusActive,
	InvitationStatusClosed,
}

func (e InvitationStatus) IsValid() bool {
	switch e {
	case InvitationStatusActive, InvitationStatusClosed:
		return true
	}
	return false
}

func (e InvitationStatus) String() string {
	return string(e)
}

func (e *InvitationStatus) UnmarshalGQL(v interface{}) error {
	str, ok := v.(string)
	if !ok {
		return fmt.Errorf("enums must be strings")
	}

	*e = InvitationStatus(str)
	if !e.IsValid() {
		return fmt.Errorf("%s is not a valid InvitationStatus", str)
	}
	return nil
}

func (e InvitationStatus) MarshalGQL(w io.Writer) {
	fmt.Fprint(w, strconv.Quote(e.String()))
}

type PushNotificationType string

const (
	PushNotificationTypeFriendshipRequestReceived  PushNotificationType = "FRIENDSHIP_REQUEST_RECEIVED"
	PushNotificationTypeFriendshipRequestAccepted  PushNotificationType = "FRIENDSHIP_REQUEST_ACCEPTED"
	PushNotificationTypeInvitationReceived         PushNotificationType = "INVITATION_RECEIVED"
	PushNotificationTypeInvitationAccepted         PushNotificationType = "INVITATION_ACCEPTED"
	PushNotificationTypeInvitationDeleted          PushNotificationType = "INVITATION_DELETED"
	PushNotificationTypeInvitationAwaitingReceived PushNotificationType = "INVITATION_AWAITING_RECEIVED"
	PushNotificationTypeChatMessageReceived        PushNotificationType = "CHAT_MESSAGE_RECEIVED"
)

var AllPushNotificationType = []PushNotificationType{
	PushNotificationTypeFriendshipRequestReceived,
	PushNotificationTypeFriendshipRequestAccepted,
	PushNotificationTypeInvitationReceived,
	PushNotificationTypeInvitationAccepted,
	PushNotificationTypeInvitationDeleted,
	PushNotificationTypeInvitationAwaitingReceived,
	PushNotificationTypeChatMessageReceived,
}

func (e PushNotificationType) IsValid() bool {
	switch e {
	case PushNotificationTypeFriendshipRequestReceived, PushNotificationTypeFriendshipRequestAccepted, PushNotificationTypeInvitationReceived, PushNotificationTypeInvitationAccepted, PushNotificationTypeInvitationDeleted, PushNotificationTypeInvitationAwaitingReceived, PushNotificationTypeChatMessageReceived:
		return true
	}
	return false
}

func (e PushNotificationType) String() string {
	return string(e)
}

func (e *PushNotificationType) UnmarshalGQL(v interface{}) error {
	str, ok := v.(string)
	if !ok {
		return fmt.Errorf("enums must be strings")
	}

	*e = PushNotificationType(str)
	if !e.IsValid() {
		return fmt.Errorf("%s is not a valid PushNotificationType", str)
	}
	return nil
}

func (e PushNotificationType) MarshalGQL(w io.Writer) {
	fmt.Fprint(w, strconv.Quote(e.String()))
}

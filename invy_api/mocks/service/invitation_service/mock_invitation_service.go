// Code generated by MockGen. DO NOT EDIT.
// Source: invitation_service.go

// Package mock_invitation_service is a generated GoMock package.
package mock_invitation_service

import (
	gomock "github.com/golang/mock/gomock"
)

// MockInvitationService is a mock of InvitationService interface.
type MockInvitationService struct {
	ctrl     *gomock.Controller
	recorder *MockInvitationServiceMockRecorder
}

// MockInvitationServiceMockRecorder is the mock recorder for MockInvitationService.
type MockInvitationServiceMockRecorder struct {
	mock *MockInvitationService
}

// NewMockInvitationService creates a new mock instance.
func NewMockInvitationService(ctrl *gomock.Controller) *MockInvitationService {
	mock := &MockInvitationService{ctrl: ctrl}
	mock.recorder = &MockInvitationServiceMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockInvitationService) EXPECT() *MockInvitationServiceMockRecorder {
	return m.recorder
}
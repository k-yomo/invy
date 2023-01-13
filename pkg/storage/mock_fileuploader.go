package storage

import (
	"context"
	"io"
)

const MockObjURL = "https://via.placeholder.com/300x300.png"

type mockFileUploader struct {
}

func NewMockFileUploader() FileUploader {
	return &mockFileUploader{}
}

func (s *mockFileUploader) Upload(ctx context.Context, fileName string, file io.Reader) (objURL string, err error) {
	return MockObjURL, nil
}

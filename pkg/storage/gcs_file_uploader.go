package storage

import (
	"context"
	"fmt"
	"io"

	gcs "cloud.google.com/go/storage"
)

type gcsFileUploader struct {
	gcsClient  *gcs.Client
	bucketName string
}

func NewGCSFileUploader(gcsClient *gcs.Client, bucketName string) FileUploader {
	return &gcsFileUploader{gcsClient: gcsClient, bucketName: bucketName}
}

func (s *gcsFileUploader) Upload(ctx context.Context, fileName string, file io.Reader) (objURL string, err error) {
	objURL = fmt.Sprintf("https://storage.googleapis.com/%s/%s", s.bucketName, fileName)
	bucket := s.gcsClient.Bucket(s.bucketName)
	obj := bucket.Object(fileName)
	writer := obj.NewWriter(ctx)
	if _, err := io.Copy(writer, file); err != nil {
		return "", err
	}
	if err := writer.Close(); err != nil {
		return "", err
	}
	return objURL, nil
}

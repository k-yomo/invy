package storage

import (
	"context"
	"io"
)

type FileUploader interface {
	Upload(ctx context.Context, fileName string, file io.Reader) (objURL string, err error)
}

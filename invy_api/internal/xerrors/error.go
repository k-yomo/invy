package xerrors

import (
	"github.com/cockroachdb/errors"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
)

type customError struct {
	code gqlmodel.ErrorCode
	err  error
}

func New(err error, code gqlmodel.ErrorCode) error {
	return &customError{code: code, err: errors.WithStackDepth(err, 1)}
}

func (ce *customError) Error() string {
	return ce.err.Error()
}

func NewErrUnauthenticated() error {
	return New(errors.New("unauthorized"), gqlmodel.ErrorCodeUnauthenticated)
}

func NewErrNotFound(err error) error {
	return New(err, gqlmodel.ErrorCodeNotFound)
}

func NewErrInvalidArgument(err error) error {
	return New(err, gqlmodel.ErrorCodeInvalidArgument)
}

// func NewErrInternal(err error) error {
// 	return New(err, gqlmodel.ErrorCodeInternal)
// }

func Code(err error) gqlmodel.ErrorCode {
	e, ok := err.(*customError)
	if !ok {
		return gqlmodel.ErrorCodeInternal
	}
	return e.code
}

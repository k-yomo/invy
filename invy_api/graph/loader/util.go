package loader

import (
	"errors"
	"fmt"

	"github.com/graph-gophers/dataloader/v7"
)

var ErrNotFound = errors.New("not found")

type LoaderKey interface {
	comparable
	fmt.Stringer
}

func convertToErrorResults[T any](err error, length int) []*dataloader.Result[T] {
	results := make([]*dataloader.Result[T], 0, length)
	for i := 0; i < length; i++ {
		var v T
		results = append(results, &dataloader.Result[T]{Data: v, Error: err})
	}
	return results
}

func convertToResults[K LoaderKey, V any](keys []K, kvMap map[K]V) []*dataloader.Result[V] {
	results := make([]*dataloader.Result[V], 0, len(keys))
	for _, key := range keys {
		if v, ok := kvMap[key]; ok {
			results = append(results, &dataloader.Result[V]{Data: v, Error: nil})
		} else {
			var nilValue V
			err := fmt.Errorf("value %q: %w", key, ErrNotFound)
			results = append(results, &dataloader.Result[V]{Data: nilValue, Error: err})
		}
	}
	return results
}

package sliceutil

import (
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
)

func MergeNodes[V gqlmodel.Node](a []V, b []V) []V {
	aMap := map[uuid.UUID]V{}
	merged := make([]V, 0, len(a)+len(b))
	for _, v := range a {
		aMap[v.GetID()] = v
		merged = append(merged, v)
	}

	for _, v := range b {
		if _, ok := aMap[v.GetID()]; !ok {
			merged = append(merged, v)
		}
	}
	return merged
}

// Dedup removes duplicated values from given slice
// WARNING: The returned slice doesn't preserve the original order.
func Dedup[T comparable](list []T) []T {
	dedupedMap := map[T]struct{}{}
	for _, v := range list {
		dedupedMap[v] = struct{}{}
	}
	dedupedSlice := make([]T, 0, len(dedupedMap))
	for v := range dedupedMap {
		dedupedSlice = append(dedupedSlice, v)
	}
	return dedupedSlice
}

func Includes[T comparable](list []T, value T) bool {
	for _, v := range list {
		if v == value {
			return true
		}
	}
	return false
}

func Filter[T comparable](list []T, value T) []T {
	filtered := make([]T, 0, len(list))
	for _, v := range list {
		if v == value {
			continue
		}
		filtered = append(filtered, v)
	}
	return filtered
}

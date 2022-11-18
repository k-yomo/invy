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

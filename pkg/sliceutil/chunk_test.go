package sliceutil

import (
	"reflect"
	"testing"
)

func TestChunk(t *testing.T) {
	t.Parallel()

	type testCase[T any] struct {
		name string
		list []T
		size int
		want [][]T
	}
	tests := []testCase[int]{
		{
			name: "size is less than list",
			list: []int{1, 2, 3},
			size: 2,
			want: [][]int{{1, 2}, {3}},
		},
		{
			name: "size is the same length as list",
			list: []int{1, 2, 3},
			size: 1,
			want: [][]int{{1}, {2}, {3}},
		},
		{
			name: "size is greater than list",
			list: []int{1, 2, 3},
			size: 4,
			want: [][]int{{1, 2, 3}},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Chunk(tt.list, tt.size); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("Chunk() = %v, want %v", got, tt.want)
			}
		})
	}
}

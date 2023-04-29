package sliceutil

import (
	"reflect"
	"testing"
)

func TestFilter(t *testing.T) {
	t.Parallel()

	type testCase[T comparable] struct {
		name string
		list []T
		f    func(value T) bool
		want []T
	}
	tests := []testCase[int]{
		{
			name: "filter only even values",
			list: []int{1, 2, 3, 4},
			f: func(value int) bool {
				return value%2 == 0
			},
			want: []int{2, 4},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Filter(tt.list, tt.f); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("Filter() = %v, want %v", got, tt.want)
			}
		})
	}
}

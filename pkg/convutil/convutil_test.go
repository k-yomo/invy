package convutil

import (
	"reflect"
	"strconv"
	"testing"
)

func TestConvertToList(t *testing.T) {
	t.Parallel()

	type args struct {
		fromValues []int
		mapFunc    func(from int) string
	}
	tests := []struct {
		name string
		args args
		want []string
	}{
		{
			name: "convert ints to strings",
			args: args{
				fromValues: []int{1, 2, 3},
				mapFunc:    strconv.Itoa,
			},
			want: []string{"1", "2", "3"},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := ConvertToList(tt.args.fromValues, tt.args.mapFunc); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("MapToList() = %v, want %v", got, tt.want)
			}
		})
	}
}

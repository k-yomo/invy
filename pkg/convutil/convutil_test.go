package convutil

import (
	"reflect"
	"strconv"
	"testing"

	"github.com/google/go-cmp/cmp"
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

func TestConvertStructToJSONMap(t *testing.T) {
	t.Parallel()

	tests := []struct {
		name    string
		v       interface{}
		want    map[string]interface{}
		wantErr bool
	}{
		{
			name: "converts struct to json map",
			v: struct {
				Name string `json:"name"`
				Age  int    `json:"age"`
			}{
				Name: "test",
				Age:  20,
			},
			want: map[string]interface{}{
				"name": "test",
				"age":  float64(20),
			},
		},
		{
			name:    "returns error when non-struct is passed",
			v:       20,
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := ConvertStructToJSONMap(tt.v)
			if (err != nil) != tt.wantErr {
				t.Errorf("ConvertStructToJSONMap() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if diff := cmp.Diff(got, tt.want); diff != "" {
				t.Errorf("ConvertStructToJSONMap(), diff: %s", diff)
			}
		})
	}
}

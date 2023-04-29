package scalar

import (
	"bytes"
	"fmt"
	"github.com/google/uuid"
	"reflect"
	"testing"
)

func TestMarshalUUID(t *testing.T) {
	t.Parallel()

	testUUID := uuid.New()

	tests := []struct {
		name string
		id   uuid.UUID
		want string
	}{
		{
			name: "marshal uuid into quoted string",
			id:   testUUID,
			want: fmt.Sprintf("%q", testUUID.String()),
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			buf := bytes.NewBuffer([]byte{})
			MarshalUUID(tt.id).MarshalGQL(buf)
			got := buf.String()
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("MarshalUUID() = %v, want %v", string(got), tt.want)
			}
		})
	}
}

func TestUnmarshalUUID(t *testing.T) {
	t.Parallel()

	testUUID := uuid.New()

	tests := []struct {
		name    string
		v       interface{}
		want    uuid.UUID
		wantErr bool
	}{
		{
			name: "returns unmarshalled uuid",
			v:    testUUID.String(),
			want: testUUID,
		},
		{
			name:    "returns error when string is invalid",
			v:       "invalid",
			wantErr: true,
		},
		{
			name:    "returns error when not string",
			v:       1,
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := UnmarshalUUID(tt.v)
			if (err != nil) != tt.wantErr {
				t.Errorf("UnmarshalUUID() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("UnmarshalUUID() got = %v, want %v", got, tt.want)
			}
		})
	}
}

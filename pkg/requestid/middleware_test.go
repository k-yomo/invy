package requestid

import (
	"context"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/k-yomo/bump/pkg/xuuid"
)

func TestMiddleware(t *testing.T) {
	want := xuuid.DummyUUID
	xuuid.MockNew(t, want)
	req := httptest.NewRequest("GET", "https://testing", nil)
	handlerToTest := Middleware(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if got := GetRequestID(r.Context()); got != want.String() {
			t.Errorf("Middleware() = %v, want %v", got, want.String())
		}
	}))
	recorder := httptest.NewRecorder()
	handlerToTest.ServeHTTP(recorder, req)
}

func TestGetRequestID(t *testing.T) {
	type args struct {
		ctx context.Context
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: "ctx with request id",
			args: args{ctx: context.WithValue(context.Background(), ctxKeyRequestID{}, "requestid")},
			want: "requestid",
		},
		{
			name: "ctx without request id",
			args: args{ctx: context.Background()},
			want: "",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := GetRequestID(tt.args.ctx); got != tt.want {
				t.Errorf("GetRequestID() = %v, want %v", got, tt.want)
			}
		})
	}
}

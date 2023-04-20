package handler

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/k-yomo/invy/pkg/logging"
	"go.uber.org/zap"
)

func HandleClientError(ctx context.Context, err error, displayErr error, status int, w http.ResponseWriter) {
	logging.Logger(ctx).Warn(err.Error(), zap.Error(err))
	w.WriteHeader(status)
	_, _ = w.Write([]byte(fmt.Sprintf(`{"status":"%d","error":"%s"}`, status, displayErr)))
}

func HandleServerError(ctx context.Context, err error, w http.ResponseWriter) {
	logging.Logger(ctx).Error(err.Error(), zap.Error(err))
	w.WriteHeader(500)
	_, _ = w.Write([]byte(`{"status":"500","error":"internal server error"}`))
}

func HandleJSONResponse(ctx context.Context, v interface{}, w http.ResponseWriter) {
	w.WriteHeader(200)
	w.Header().Set("Content-Type", "application/json")
	jsonBytes, err := json.Marshal(v)
	if err != nil {
		HandleServerError(ctx, err, w)
		return
	}
	_, _ = w.Write(jsonBytes)
}

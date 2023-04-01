package logging

import (
	"context"

	"github.com/blendle/zapdriver"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

func NewLogger(isDev bool, version string) (*zap.Logger, error) {
	var logger *zap.Logger
	var err error
	if isDev {
		config := zap.NewDevelopmentConfig()
		config.EncoderConfig.EncodeLevel = zapcore.CapitalColorLevelEncoder
		logger, err = config.Build()
	} else {
		config := zapdriver.NewProductionConfig()
		config.Sampling = nil
		config.OutputPaths = []string{"stdout"}
		config.InitialFields = map[string]interface{}{
			"version": version,
		}
		logger, err = config.Build()
	}
	if err != nil {
		return nil, err
	}
	return logger, nil
}

// Logger returns logger from context if exist or from global variable
func Logger(ctx context.Context) *zap.Logger {
	return ctxzap.Extract(ctx)
}

func AddFields(ctx context.Context, fields ...zap.Field) {
	ctxzap.AddFields(ctx, fields...)
}

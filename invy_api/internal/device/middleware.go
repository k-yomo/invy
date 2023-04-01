package device

import (
	"context"
	"fmt"
	"net/http"
	"strconv"

	"github.com/hashicorp/go-version"
	"github.com/k-yomo/invy/pkg/logging"
	"go.uber.org/zap"
)

const (
	headerAppVersion         = "X-App-Version"
	headerAppBuildNumber     = "X-App-Build-Number"
	headerDeviceManufacturer = "X-Device-Manufacturer"
	headerDevicePlatform     = "X-Device-Platform"
	headerDeviceOSVersion    = "X-Device-OS-Version"
	headerDeviceModel        = "X-Device-Model"
	headerDeviceID           = "X-Device-Id"
)

type ctxKeyDevice struct{}

func setDevice(ctx context.Context, device *Device) context.Context {
	return context.WithValue(ctx, ctxKeyDevice{}, device)
}

func GetDevice(ctx context.Context) *Device {
	device, ok := ctx.Value(ctxKeyDevice{}).(*Device)
	if !ok {
		return &Device{}
	}
	return device
}

// Middleware sets Device into context
func Middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		ctx := r.Context()

		buildNumber, _ := strconv.Atoi(r.Header.Get(headerAppBuildNumber))
		versionHeader := r.Header.Get(headerAppVersion)
		appVersion, err := version.NewVersion(versionHeader)
		if err != nil {
			logging.Logger(ctx).Warn(
				fmt.Sprintf("failed to parse app version header, value: '%s'", versionHeader),
				zap.Error(err),
			)
			w.WriteHeader(http.StatusBadRequest)
			_, _ = w.Write([]byte("invalid app version header"))
			return
		}
		device := Device{
			AppVersion:     appVersion,
			AppBuildNumber: buildNumber,
			Manufacturer:   r.Header.Get(headerDeviceManufacturer),
			Platform:       r.Header.Get(headerDevicePlatform),
			OSVersion:      r.Header.Get(headerDeviceOSVersion),
			Model:          r.Header.Get(headerDeviceModel),
			DeviceID:       r.Header.Get(headerDeviceID),
		}
		ctx = setDevice(ctx, &device)
		logging.AddFields(ctx, zap.Any("device", device))

		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

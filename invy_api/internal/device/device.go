package device

import "github.com/hashicorp/go-version"

// MinRequiredAppVersion is the minimum required app version.
// WARN: Please be extra careful when update this version.
const MinRequiredAppVersion = "1.3.0"

type Device struct {
	AppVersion     *version.Version // e.g. 1.0.0
	AppBuildNumber int              // e.g. 153
	Manufacturer   string           // e.g. Apple
	Platform       string           // e.g. ios
	OSVersion      string           // e.g. 16.2
	Model          string           // e.g. iPhone 14
	DeviceID       string
}

package device

import "github.com/hashicorp/go-version"

type Device struct {
	AppVersion     *version.Version // e.g. 1.0.0
	AppBuildNumber int              // e.g. 153
	Manufacturer   string           // e.g. Apple
	Platform       string           // e.g. ios
	OSVersion      string           // e.g. 16.2
	Model          string           // e.g. iPhone 14
}

package device

import (
	"testing"

	"github.com/hashicorp/go-version"
)

func TestMinRequiredAppVersion(t *testing.T) {
	_, err := version.NewVersion(MinRequiredAppVersion)
	if err != nil {
		t.Errorf("MinRequiredAppVersion is not a valid version: %s", err)
	}
}

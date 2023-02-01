package length

import "testing"

func TestLength_Meters(t *testing.T) {
	want := float64(100)
	got := NewMeter(100).Meters()

	if got != want {
		t.Errorf("Meters() = %v, want %v", got, want)
	}
}

package location

import "testing"

func TestGetRandomLocation(t *testing.T) {
	t.Parallel()

	centerLat := 35.6585663
	centerLon := 139.6980641

	for i := 0; i < 10; i++ {
		gotLat, gotLon := GetRandomLocation(centerLat, centerLon, 1000)
		if got := CalcDistanceMeter(centerLat, centerLon, gotLat, gotLon); got > 1000 {
			t.Errorf("GetRandomLocation(), distance got = %v, want <= %v", got, 1000)
		}
	}
}

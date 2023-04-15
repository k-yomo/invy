package location

import (
	"math"
	"math/rand"
	"time"
)

const (
	EarthRadius = 6371000 // meters
	DegToRad    = math.Pi / 180.0
	ThreePi     = math.Pi * 3
	TwoPi       = math.Pi * 2
)

// GetRandomLocation returns random geo point within a radius of the given point
// Copied from https://github.com/rmrs/random-location/blob/master/src/index.js
func GetRandomLocation(lat, lon float64, radiusInMeters int) (float64, float64) {
	random := rand.New(rand.NewSource(time.Now().UnixNano()))

	sinLat := math.Sin(convertDegreesToRadians(lat))
	cosLat := math.Cos(convertDegreesToRadians(lon))

	// Random bearing (direction out 360 degrees)
	bearing := random.Float64() * TwoPi
	sinBearing := math.Sin(bearing)
	cosBearing := math.Cos(bearing)

	// Theta is the approximated angular distance
	theta := float64(radiusInMeters) / EarthRadius
	sinTheta := math.Sin(theta)
	cosTheta := math.Cos(theta)

	rLatitude := math.Asin(sinLat*cosTheta + cosLat*sinTheta*cosBearing)

	rLongitude :=
		convertDegreesToRadians(lon) +
			math.Atan2(
				sinBearing*sinTheta*cosLat,
				cosTheta-sinLat*math.Sin(rLatitude),
			)

	// Normalize longitude L such that -PI < L < +PI
	rLongitude = math.Mod(rLongitude+ThreePi, TwoPi) - math.Pi

	return convertRadiansToDegrees(rLatitude), convertRadiansToDegrees(rLongitude)
}

func convertDegreesToRadians(degrees float64) float64 {
	return degrees * DegToRad
}

func convertRadiansToDegrees(radians float64) float64 {
	return radians / DegToRad
}

func CalcDistanceMeter(lat1, lon1, lat2, lon2 float64) float64 {
	// convert to radians
	// must cast radius as float to multiply later
	var la1, lo1, la2, lo2, r float64
	la1 = lat1 * math.Pi / 180
	lo1 = lon1 * math.Pi / 180
	la2 = lat2 * math.Pi / 180
	lo2 = lon2 * math.Pi / 180

	r = 6378100 // Earth radius in METERS

	// calculate
	h := hsin(la2-la1) + math.Cos(la1)*math.Cos(la2)*hsin(lo2-lo1)

	return 2 * r * math.Asin(math.Sqrt(h))
}

func hsin(theta float64) float64 {
	return math.Pow(math.Sin(theta/2), 2)
}

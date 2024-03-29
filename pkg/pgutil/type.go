package pgutil

import (
	"database/sql"
	"database/sql/driver"
	"encoding/hex"

	"github.com/twpayne/go-geom"
	"github.com/twpayne/go-geom/encoding/ewkb"
)

var _ driver.Value = &GeoPoint{}
var _ sql.Scanner = &GeoPoint{}

// GeoPoint defined GeomPoint data type, need to implement driver.Valuer, sql.Scanner interface
type GeoPoint struct {
	*geom.Point
}

func NewGeoPoint(latitude float64, longitude float64) *GeoPoint {
	return &GeoPoint{
		Point: geom.NewPoint(geom.XY).
			MustSetCoords(geom.Coord{longitude, latitude}).
			SetSRID(4326),
	}
}

// Lat returns latitude of the geometry point value
func (g *GeoPoint) Lat() float64 {
	return g.Y()
}

// Lon returns longitude of the geometry point value
func (g *GeoPoint) Lon() float64 {
	return g.X()
}

// Value returns geometry point value, implement driver.Valuer interface
func (g *GeoPoint) Value() (driver.Value, error) {
	if g == nil {
		return nil, nil
	}
	ewkbPt := ewkb.Point{Point: g.Point.SetSRID(4326)}
	return ewkbPt.Value()
}

// Scan scans value into geom.Point, implements sql.Scanner interface
func (g *GeoPoint) Scan(value interface{}) error {
	if value == nil {
		return nil
	}

	t, err := hex.DecodeString(string(value.([]uint8)))
	if err != nil {
		return err
	}

	gt, err := ewkb.Unmarshal(t)
	if err != nil {
		return err
	}
	p := GeoPoint{gt.(*geom.Point)}
	*g = p

	return nil
}

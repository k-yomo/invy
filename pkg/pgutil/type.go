package pgutil

import (
	"database/sql"
	"database/sql/driver"
	"encoding/hex"

	"github.com/twpayne/go-geom"
	"github.com/twpayne/go-geom/encoding/ewkb"
)

// GeoPoint defined GeomPoint data type, need to implement driver.Valuer, sql.Scanner interface
type GeoPoint struct {
	*geom.Point
}

var _ driver.Value = &GeoPoint{}
var _ sql.Scanner = &GeoPoint{}

// Value returns geometry point value, implement driver.Valuer interface
func (g *GeoPoint) Value() (driver.Value, error) {
	ewkbPt := ewkb.Point{Point: g.Point.SetSRID(4326)}
	return ewkbPt.Value()
}

// Scan scans value into geom.Point, implements sql.Scanner interface
func (g *GeoPoint) Scan(value interface{}) error {
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

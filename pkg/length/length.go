package length

// Length represents the length of a thing
type Length int64

// common lengths
const (
	Millimeter Length = 1
	Centimeter        = Millimeter * 10
	// Meter represents millimeter(m)
	Meter = Centimeter * 100
	// KiloMeter represents millimeter(km)
	KiloMeter = Meter * 1000
)

func NewMeter(meter int) Length {
	return Length(meter) * Meter
}

// Millimeters returns the length as a millimeter(mm)
func (l Length) Millimeters() int64 {
	return int64(l)
}

// Centimeters returns the length as a centimeter(cm)
func (l Length) Centimeters() float64 {
	cm := l / Centimeter
	mm := l % Centimeter
	return float64(cm) + float64(mm)/10
}

// Meters returns the length as a millimeter(m)
func (l Length) Meters() float64 {
	cm := l / Meter
	mm := l % Meter
	return float64(cm) + float64(mm)/1e3
}

// Kilometers returns the length as a kilometers(km)
func (l Length) Kilometers() float64 {
	cm := l / KiloMeter
	mm := l % KiloMeter
	return float64(cm) + float64(mm)/1e6
}

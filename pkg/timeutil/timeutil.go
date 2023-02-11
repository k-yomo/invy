package timeutil

import (
	"bytes"
	"encoding/json"
	"time"
)

const RFC3339Milli = "2006-01-02T15:04:05.999Z07:00"

var JST = time.FixedZone("Asia/Tokyo", 9*60*60)

type JSONRFC3339Milli time.Time

func (jt *JSONRFC3339Milli) UnmarshalJSON(data []byte) error {
	b := bytes.NewBuffer(data)
	dec := json.NewDecoder(b)
	var s string
	if err := dec.Decode(&s); err != nil {
		return err
	}
	t, err := time.Parse(RFC3339Milli, s)
	if err != nil {
		return err
	}
	*jt = JSONRFC3339Milli(t)
	return nil
}

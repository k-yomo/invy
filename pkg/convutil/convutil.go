package convutil

import (
	"encoding/json"
	"reflect"

	"github.com/cockroachdb/errors"
)

func ConvertToList[FROM any, TO any](fromValues []FROM, mapFunc func(from FROM) TO) []TO {
	toValues := make([]TO, 0, len(fromValues))
	for _, from := range fromValues {
		toValues = append(toValues, mapFunc(from))
	}
	return toValues
}

func ConvertToListAndError[FROM any, TO any](fromValues []FROM, mapFunc func(from FROM) (TO, error)) ([]TO, error) {
	toValues := make([]TO, 0, len(fromValues))
	for _, from := range fromValues {
		toValue, err := mapFunc(from)
		if err != nil {
			return nil, err
		}
		toValues = append(toValues, toValue)
	}
	return toValues, nil
}

func ConvertStructToJSONMap(v interface{}) (map[string]interface{}, error) {
	if reflect.ValueOf(v).Kind() != reflect.Struct {
		return nil, errors.New("value must be struct")
	}
	jsonValue, err := json.Marshal(v)
	if err != nil {
		return nil, err
	}
	var jsonMap map[string]interface{}
	if err := json.Unmarshal(jsonValue, &jsonMap); err != nil {
		return nil, err
	}
	return jsonMap, nil
}

func ConvertMapToStructViaJSON(v map[string]interface{}, st interface{}) error {
	if reflect.ValueOf(st).Kind() != reflect.Struct {
		return errors.New("value must be struct")
	}
	jsonValue, err := json.Marshal(v)
	if err != nil {
		return err
	}
	return json.Unmarshal(jsonValue, st)
}

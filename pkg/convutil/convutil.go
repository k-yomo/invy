package convutil

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

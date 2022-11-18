package directive

import (
	"context"
	"fmt"
	"regexp"
	"unicode/utf8"

	"github.com/99designs/gqlgen/graphql"
	validation "github.com/go-ozzo/ozzo-validation/v4"
	"github.com/go-ozzo/ozzo-validation/v4/is"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
)

func Constraint(ctx context.Context, obj interface{}, next graphql.Resolver, min *int, max *int, pattern *string, format *gqlmodel.ConstraintFormat) (interface{}, error) {
	v, _ := next(ctx)

	switch value := v.(type) {
	case string:
		if err := stringConstraint(value, min, max, pattern, format); err != nil {
			return nil, err
		}
	case *string:
		if value != nil {
			if err := stringConstraint(*value, min, max, pattern, format); err != nil {
				return nil, err
			}
		}
	case int:
		if err := intConstraint(value, min, max); err != nil {
			return nil, err
		}
	case *int:
		if value != nil {
			if err := intConstraint(*value, min, max); err != nil {
				return nil, err
			}
		}
	}

	return v, nil
}

func stringConstraint(value string, min *int, max *int, pattern *string, format *gqlmodel.ConstraintFormat) error {
	if max != nil && utf8.RuneCountInString(value) > *max {
		return fmt.Errorf("'%s' is loger than max length of %d", value, *max)
	}

	if min != nil && utf8.RuneCountInString(value) < *min {
		return fmt.Errorf("'%s' is shoter than max length of %d", value, *min)
	}

	if pattern != nil {
		r := regexp.MustCompile(*pattern)
		if !r.MatchString(value) {
			return fmt.Errorf("'%s' does not match pattern of %s", value, *pattern)
		}
	}

	if format != nil {
		switch *format {
		case gqlmodel.ConstraintFormatEmail:
			err := validation.Validate(value,
				validation.Required,
				is.URL,
			)
			if err != nil {
				return err
			}
		case gqlmodel.ConstraintFormatURL:
			err := validation.Validate(value,
				validation.Required,
				is.Email,
			)
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func intConstraint(value int, min *int, max *int) error {
	if max != nil && value > *max {
		return fmt.Errorf("%d is greater than max %d", value, *max)
	}

	if min != nil && value < *min {
		return fmt.Errorf("%d is smaller than min %d", value, *min)
	}

	return nil
}

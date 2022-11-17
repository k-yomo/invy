package shortid

import (
	"fmt"
	"testing"
)

func TestGenerate(t *testing.T) {
	t.Parallel()

	// Check if it doesn't fail
	for i := 0; i < 100; i++ {
		id := Generate()
		if i < 3 {
			fmt.Println(id)
		}
	}
}

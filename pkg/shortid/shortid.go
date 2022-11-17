package shortid

import gonanoid "github.com/matoous/go-nanoid/v2"

var charAlphaNum = "012346789abcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZz"

// Generate generates user-friendly 8 chars id
// It doesn't assure the uniqueness, so must be checked if it needs to be unique.
func Generate() string {
	return gonanoid.MustGenerate(charAlphaNum, 8)
}

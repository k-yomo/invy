package sliceutil

func Chunk[T any](list []T, size int) [][]T {

	var chunks [][]T

	listLen := len(list)
	for i := 0; i < listLen; i += size {
		end := i + size
		if listLen < end {
			end = listLen
		}
		chunks = append(chunks, list[i:end])
	}

	return chunks
}

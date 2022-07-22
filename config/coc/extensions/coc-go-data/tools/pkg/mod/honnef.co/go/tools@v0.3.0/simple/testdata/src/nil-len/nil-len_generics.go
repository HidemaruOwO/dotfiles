//go:build go1.18

package pkg

func fn1[T []int | *[4]int](a T) {
	if a != nil && len(a) > 0 { // don't flag, because of the pointer
	}
}

func fn2[T []int | []string | map[string]int](a T) {
	if a != nil && len(a) > 0 { // want `should omit nil check`
	}
}

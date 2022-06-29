//go:build go1.18

package pkg

func tpfn1[T any]() T { var zero T; return zero }

func tpfn() {
	if tpfn1[bool]() == true { // want `simplified to tpfn1\[bool\]\(\)`
	}
	if tpfn1[any]() == true {
	}
}

func tpfn2[T bool](x T) {
	if x == true { // want `omit comparison to bool constant`
	}
}

func tpfn3[T ~bool](x T) {
	if x == true { // want `omit comparison to bool constant`
	}
}

type MyBool bool

func tpfn4[T bool | MyBool](x T) {
	if x == true { // want `omit comparison to bool constant`
	}
}

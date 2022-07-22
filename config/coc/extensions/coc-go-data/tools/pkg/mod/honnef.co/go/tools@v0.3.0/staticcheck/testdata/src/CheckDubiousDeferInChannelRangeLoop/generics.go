//go:build go1.18

package pkg

func tpfn[T chan int]() {
	var ch T
	for range ch {
		defer println() // want `defers in this range loop`
	}
}

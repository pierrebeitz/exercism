// The package name is expected by the test program.
package leap

import (
	"time"
)

// testVersion should match the targetTestVersion in the test file.
const testVersion = 2

// an example utilizing concurrency.
func IsLeapYear(year int) bool {
  mods := [...]int{4, 100, 400}

	var m = make(map[int]<-chan bool)
  for _, element := range mods {
    m[element]   = RequestFuture(year, element)
  }

	return <-m[4] && (!<-m[100] || <-m[400])
}

func DivisibleBy(year int, divider int) bool {
	time.Sleep(40 * time.Millisecond) // make DivisibleBy expensive!
	return (year%divider == 0)
}

func RequestFuture(year int, mod int) <-chan bool {
	c := make(chan bool, 1)
	go func() { c <- DivisibleBy(year, mod) }()
	return c
}

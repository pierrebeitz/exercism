package letter


import (
    "runtime"
)

type FreqMap map[rune]int

func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

func ConcurrentFrequency(s []string) FreqMap {
  runtime.GOMAXPROCS(2)

  ch := make(chan FreqMap, len(s))

	for _, text := range s {
    go func(text string) {
      ch <- Frequency(text)
    }(text)
	}

	m := FreqMap{}
	for range s {
    for letter, count := range <-ch {
      m[letter] += count
    }
  }
	return m
}


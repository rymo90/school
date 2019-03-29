package main

import (
	"fmt"
	"time"
)

// This program should go to 11, but it seemingly only prints 1 to 10.
func main() {
	ch := make(chan int)
	go Print(ch)
	for i := 1; i <= 11; i++ {
		ch <- i
	}
	close(ch)
}

// Print prints all numbers sent on the channel.
// The function returns when the channel is closed.
func Print(ch <-chan int) {
	for n := range ch { // reads from channel until it's closed
    // by switching the timesleep and n i was able to print the last element
    fmt.Println(n)
    time.Sleep(10 * time.Millisecond) // simulate processing time
	}
}

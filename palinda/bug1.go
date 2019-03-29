package main

import "fmt"

// I want this program to print "Hello world!", but it doesn't work.
func main() {
  // sending and receiving  a nil channel blocks forever
  // by adding one in  the secound argument of ch ,
  // we created a buffere channel .
  ch := make(chan string,1)
	ch <- "Hello world!"
	fmt.Println(<-ch)
}

package main

// import "fmt"
func main() {
	println("main go")
	Server := NewServer("192.168.101.84", 80)
	Server.Start()

}

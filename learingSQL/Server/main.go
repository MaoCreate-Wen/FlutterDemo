package main

func main() {
	println("main go")
	Server := NewServer(80, "192.168.101.84")
	Server.Start()
}

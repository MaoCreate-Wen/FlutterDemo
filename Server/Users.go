package main

import "net"

type Users struct {
	Name string
	Addr string
	C    chan string
	conn net.Conn
}

func NewUsers(conn net.Conn) *Users {
	UsersAddr := conn.RemoteAddr().String()
	Users := &Users{
		Name: UsersAddr,
		Addr: UsersAddr,
		C:    make(chan string),
		conn: conn,
	}
	go Users.ListenChannl()
	return Users
}
func (this *Users) ListenChannl() {
	for {
		msg := <-this.C
		this.conn.Write([]byte(msg + "\n"))
	}
}

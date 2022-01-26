package main

import "net"

type User struct {
	Username string
	PassWord string
	Icon     string
	LastWord string
}

func NewUsers(conn net.Conn) *User {
	Users := &User{}
	return Users
}

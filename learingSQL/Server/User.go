package main

import "net"

type User struct {
	Username string
	PassWord string
	Icon     string
	LastWord string
	conn     net.Conn
}

func NewUsers(UserName string, conn net.Conn) *User {
	Users := &User{
		conn:     conn,
		Username: UserName,
	}
	return Users
}

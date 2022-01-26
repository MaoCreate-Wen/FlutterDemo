package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net"
)

type Server struct {
	Port int
	Addr string
}
type Massge struct {
	Type    string `json:"msg_type"`
	From    string `json:"msg_from"`
	Content string `json:"msg_content"`
	To      string `json:"msg_to"`
}

func NewServer(Port int, Addr string) *Server {
	server := &Server{
		Port: Port,
		Addr: Addr,
	}
	return server
}
func (this *Server) Start() {
	listen, err := net.Listen("tcp4", fmt.Sprintf("%s:%d", this.Addr, this.Port))
	if err != nil {
		println("Listen err:", err)
	}
	defer listen.Close()
	for {
		connect, err := listen.Accept()
		if err != nil {
			println("accept error", err)
			return
		}
		this.handle(connect)
	}
}
func (this *Server) handle(Conn net.Conn) {
	go func() {
		buf := make([]byte, 10240)
		n, err := Conn.Read(buf)
		if err != nil && err != io.EOF {
			println("connect read err:", err)
			return
		}
		if n == 0 {
			println("users off line")
		}

		getdata := string(buf[:n]) //将获取到的内容转成字符串格式
		println()
		var msg = &Massge{}                   //创建massge结构体
		json.Unmarshal([]byte(getdata), &msg) //字符串转化json格式，并且填充至data map中
		fmt.Println(msg.Type)
	}()

}

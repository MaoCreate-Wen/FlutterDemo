package main

import (
	"fmt"
	"io"
	"net"
)

//定义一个服务器对象
type Server struct {
	ip        string
	port      int
	OnlineMap map[string]*Users
	Massage   chan string
}

//创建一个服务器对象
func NewServer(ip string, port int) *Server {
	server := &Server{
		ip:        ip,
		port:      port,
		OnlineMap: make(map[string]*Users),
		Massage:   make(chan string),
	}
	return server
}

//启动服务器
func (this *Server) Start() {
	listen, err := net.Listen("tcp4", fmt.Sprintf("%s:%d", this.ip, this.port)) //监听地址与端口
	if err != nil {
		println("Listen error:", err)
	} //错误处理
	defer listen.Close()
	go this.ListenMassge()
	for {
		connect, err := listen.Accept()
		if err != nil {
			println("accept error:", err)
			continue
		} //接受用户连接
		go this.handle(connect)
	}
}
func (this *Server) handle(connect net.Conn) {
	// fmt.Println("succed connected")
	user := NewUsers(connect)        //创建用户，获取用户地址
	this.OnlineMap[user.Name] = user //将用户添加到onlinemap中
	this.SendMassge(user, "用户已上线")
	go func() {
		buf := make([]byte, 4096)
		n, err := connect.Read(buf)
		if n == 0 {
			this.SendMassge(user, "用户已下线")
			return
		}
		if err != nil && err != io.EOF {
			println("connect read error:", err)
			return
		}
		msg := string(buf[:n-1])
		this.SendMassge(user, msg)
	}() //接受来自用户发送的数据
	select {}
}
func (this *Server) SendMassge(user *Users, msg string) {
	sendmassge := "[" + user.Addr + "]" + ":" + msg
	this.Massage <- sendmassge
	println(sendmassge)
} //广播信息
func (this *Server) ListenMassge() {
	for {
		msg := <-this.Massage //持续监听massage中是否有信息
		for _, cli := range this.OnlineMap {
			cli.C <- msg
		}
	}

} //监听广播事件

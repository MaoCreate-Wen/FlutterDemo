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

var onlineMap = make(map[string]*User)

type Massge struct {
	Type     string `json:"msg_type"`
	From     string `json:"msg_from"`
	Content  string `json:"msg_content"`
	Username string `json:"msg_username"`
	PassWord string `json:"msg_password"`
	To       string `json:"msg_to"`
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
		var UserListen net.Conn
		for {
			buf := make([]byte, 10240)
			send := make([]byte, 10240)
			var sendContent string
			send = []byte(sendContent)
			n, err := Conn.Read(buf)
			if err != nil && err != io.EOF {
				println("connect read err:", err)
				return
			}
			if n == 0 {
				println("users off line")
				break
			}
			println("Connect:%d", Conn.RemoteAddr().String())
			getdata := string(buf[:n]) //将获取到的内容转成字符串格式
			println()
			var msg = &Massge{}                   //创建massge结构体
			json.Unmarshal([]byte(getdata), &msg) //字符串转化json格式，并且填充至data map中
			fmt.Println(msg.Type)
			if msg.Type == "login" {
				println("get login massge")
				println(msg.Username)
				println(msg.PassWord)
				PassWordCheck := CheckUsersPassword(msg.Username, msg.PassWord)
				if PassWordCheck == false {
					println("PassWord error")
					println(send)
					SendMassge("login error", Conn)
				} else {
					SendMassge("login succes", Conn)
					println("login sec")
					user := NewUsers(msg.Username, UserListen)
					onlineMap[user.Username] = user
					// println(onlineMap[user.Username])
				}
			}
			if msg.Type == "content" {
				println(msg.Content)
			}
			if msg.Type == "ListenAddr" {
				UserListen = Conn
			}
			if msg.Type == "sign" {
				IsNewUser := CheckUsers(msg.Username)
				if IsNewUser == false {
					NewUser := &Users{
						Username: msg.Username,
						PassWord: msg.PassWord,
						Icon:     "",
					}

					AddNewUsers(NewUser)
					println("sign sec")
					SendMassge("sin sec", Conn)
				} else {
					SendMassge("the user is existence", Conn)
				}

			}
			if msg.Type == "TestSocket" {
				println("test")
				for i := 0; i < 10; i++ {
					SendMassge("send", Conn)
					UserListen = Conn
				}
				TestSocket(UserListen)
			}
			if msg.Type == "search" {
				user := SearchUsers(msg.Username)
				fmt.Println("Name:", user)
				fmt.Printf("%T\n", user)
				// SendMassge(user,Conn);
			}
		}
	}()

}
func TestSocket(conn net.Conn) {
	SendMassge("test", conn)
}
func SendMassge(msg string, conn net.Conn) {
	sendContent := []byte(msg)
	n, err := conn.Write(sendContent)
	if err != nil {
		println("send err:", err)
	}
	if n == 0 {
		println("users off line")
		return
	}
	println("SendMsg:", msg)
}

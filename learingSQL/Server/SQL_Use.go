package main

import (
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

var db *sqlx.DB

type Users struct {
	Username string `db:"usersname"`
	PassWord string `db:"PassWord"`
	Icon     string `db:"Icon"`
	LastWord string `db:"LastWord"`
}

func init() {
	database, err := sqlx.Open("mysql", "root:root@tcp(127.0.0.1:3306)/usersdata")
	if err != nil {
		fmt.Println("open mysql failed,", err)
		return
	}
	db = database
}
func CheckUsersPassword(UserName string, Password string) bool {
	var users []Users
	sql := "select usersname,PassWord, Icon,LastWord from usersdata where UsersName = ? and PassWord = ?"
	err := db.Select(&users, sql, UserName, Password)
	if err != nil {
		fmt.Println("exec failed, ", err)
		return false
	}
	if users != nil {
		fmt.Println("select succ:", users)
		return true
	} else {
		fmt.Println("unfind Users")
		return false
	}

}
func CheckUsers(UserName string) bool {
	var users []Users
	sql := "select usersname,PassWord, Icon,LastWord from usersdata where UsersName = ?"
	err := db.Select(&users, sql, UserName)
	if err != nil {
		fmt.Println("exec failed, ", err)
		return false
	}
	if users != nil {
		fmt.Println("select succ:", users)
		return true
	} else {
		fmt.Println("unfind Users")
		return false
	}

}
func SearchUsers(UserName string) []string {
	var users []string
	sql := "select usersname,PassWord, Icon,LastWord from usersdata where UsersName = ?"
	err := db.Select(&users, sql, UserName)
	if err != nil {
		fmt.Println("exec failed, ", err)
	}
	check := CheckUsers(UserName)
	if check != false {
		println(users)
	}
	return users
}
func AddNewUsers(Users *Users) {
	sql := "insert into usersdata(usersname,PassWord, Icon,LastWord)values (?,?,?,?)"
	value := [5]string{Users.Username, Users.PassWord, Users.Icon, Users.LastWord}

	//执行SQL语句
	r, err := db.Exec(sql, value[0], value[1], value[2], value[3])
	if err != nil {
		fmt.Println("exec failed,", err)
		return
	}

	//查询最后一天用户ID，判断是否插入成功
	UsersName, err := r.LastInsertId()
	if err != nil {
		fmt.Println("exec failed,", err)
		return
	}
	fmt.Println("insert succ", UsersName)
}
func deleteUsers(Username string) {

	sql := "delete from usersdata where UsersName=?"

	res, err := db.Exec(sql, Username)
	if err != nil {
		fmt.Println("exce failed,", err)
		return
	}

	row, err := res.RowsAffected()
	if err != nil {
		fmt.Println("row failed, ", err)
	}
	fmt.Println("delete succ: ", row)
}
func update(afterUpdate string, usersName string) {

	//执行SQL语句
	sql := "update usersdata set usersname =? where UsersName = ?"
	res, err := db.Exec(sql, afterUpdate, usersName)

	if err != nil {
		fmt.Println("exec failed,", err)
		return
	}

	//查询影响的行数，判断修改插入成功
	row, err := res.RowsAffected()
	if err != nil {
		fmt.Println("rows failed", err)
	}

	fmt.Println("update succ:", row)

}

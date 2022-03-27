import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wechat/Server/cli.dart';
import 'package:wechat/UersData/UersList.dart';
import 'package:wechat/chat.dart';
import 'mainpage.dart';
import 'Server/cli.dart';
import 'search.dart';

void main(List<String> args) {
  runApp(LoginPage());
  // SocketMassge.ConnectServer();
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SocketMassge>(
      create: (_) => SocketMassge(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/mainpage": (context) => Mainpage(),
            "/chat": (context) => chat(),
            "/search": (context) => Search(),
          },
          home: MianPage2()),
    );
  }
}

class MianPage2 extends StatefulWidget {
  MianPage2({Key? key}) : super(key: key);

  @override
  State<MianPage2> createState() => _MianPage2State();
}

class _MianPage2State extends State<MianPage2> {
  @override
  TextEditingController InputUsersName = TextEditingController();
  TextEditingController InputUsersPassword = TextEditingController();
  // var socket = SocketMassge;

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<SocketMassge>(
          builder: (_, SocketMassge, child) {
            SocketMassge.ConnectServer();
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assetImage/loginBacgroundImage.jpg"),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // child: Text("image"),
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assetImage/qiyuanicon.png"),
                            )),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextField(
                            controller: InputUsersName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelText: "用户名"),
                          ),
                          TextField(
                            controller: InputUsersPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelText: "密码"),
                          ),
                          GestureDetector(
                            child: Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 255, 0.7),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Center(
                                  child: Text(
                                    "登录",
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            onTap: () {
                              if (InputUsersName.text != "" &&
                                  InputUsersPassword.text != "") {
                                SocketMassge.sendmsg(
                                    '{"msg_type":"login","msg_username":"${InputUsersName.text}","msg_password":"${InputUsersPassword.text}"}');
                                Timer(Duration(milliseconds: 200), () {
                                  if (SocketMassge.Data == "login error") {
                                    print("login error");
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text("用户名或密码错误"),
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text("登录成功"),
                                        );
                                      },
                                    );
                                    Navigator.pushNamed(context, "/mainpage");
                                  }
                                });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text("不能为空"),
                                    );
                                  },
                                );
                              }

                              // SocketMassge.sendmsg('{"msg_type":"TestSocket"}');
                              // print("data:$ListenData");
                            },
                          ),
                          GestureDetector(
                            child: Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 255, 0.7),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Center(
                                  child: Text(
                                    "注册",
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            onTap: () {
                              // Navigator.pushNamed(context, "/mainpage");
                              if (InputUsersName.text != "" &&
                                  InputUsersPassword.text != "") {
                                SocketMassge.sendmsg(
                                    '{"msg_type":"sign","msg_username":"${InputUsersName.text}","msg_password":"${InputUsersPassword.text}"}');
                                print(SocketMassge.Data);
                                Timer(Duration(milliseconds: 200), () {
                                  if (SocketMassge.Data ==
                                      "the user is existence") {
                                    print("login error");
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text("用户已存在"),
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text("注册成功"),
                                        );
                                      },
                                    );
                                  }
                                });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text("不能为空"),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}

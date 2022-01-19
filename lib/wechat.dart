import 'dart:convert';
import 'dart:ffi';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:wechat/chat.dart';
import 'package:wechat/UersData/UersList.dart';

void main(List<String> args) {
  runApp(Wechat());
}

class Wechat extends StatefulWidget {
  Wechat({Key? key}) : super(key: key);

  @override
  _WechatState createState() => _WechatState();
}

class _WechatState extends State<Wechat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Title(),
      routes: {
        "/chat": (context) => chat(),
      },
    );
  }
}

class Title extends StatefulWidget {
  Title({Key? key}) : super(key: key);

  @override
  _TitleState createState() => _TitleState();
}

class _TitleState extends State<Title> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Color.fromRGBO(224, 224, 224, 0.5),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: Text(
          "聊天",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WechatList(),
    );
  }
}

class WechatList extends StatefulWidget {
  WechatList({Key? key}) : super(key: key);

  @override
  _WechatListState createState() => _WechatListState();
}

class _WechatListState extends State<WechatList> {
  List<Widget> _GetUersList() {
    List<Widget> UersList = [];
    for (var i = 0; i < 20; ++i) {
      UersList.add(Column(
        children: [
          ListTile(
            leading: Container(
              height: 45,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assetImage/Mao-CreateIcon.jpg"),
                      fit: BoxFit.fill),
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            title: Text("袤创科技"),
            subtitle: Row(
              children: [
                Expanded(
                  child: Text(
                    "冯总：出来吹水",
                    textAlign: TextAlign.left,
                  ),
                  flex: 1,
                ),
                Expanded(
                    child: Text(
                  "2022-11-11",
                  textAlign: TextAlign.right,
                ))
              ],
            ),
            trailing: Icon(Icons.mail_outline),
            onLongPress: () {},
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed("/chat");
              // ReSetPage(2);
            },
          ),
          Divider(
            height: 3,
          )
        ],
      ));
    }
    return UersList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._GetUersList(),
    );
  }
}

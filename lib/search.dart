import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wechat/Server/cli.dart';
import 'package:wechat/main.dart';

void main(List<String> args) {
  runApp(Search());
}

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

TextEditingController userController = TextEditingController();
String? TextContent;
List<Widget> UsersSearchResult = [];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SearchWidegt(),
      ],
    ));
  }
}

class SearchWidegt extends StatefulWidget {
  SearchWidegt({Key? key}) : super(key: key);

  @override
  State<SearchWidegt> createState() => _SearchWidegtState();
}

class _SearchWidegtState extends State<SearchWidegt> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromRGBO(204, 204, 204, 0.2),
          ),
          width: 300,
          height: 40,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.search,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: userController,
                  cursorColor: Color(0xFF464EB5),
                  maxLines: null,
                  decoration: InputDecoration(
                    counterText: TextContent,
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                    hintText: "search",
                    hintStyle:
                        TextStyle(color: Color(0xFFADB3BA), fontSize: 15),
                  ),
                  style: TextStyle(color: Color(0xFF03073C), fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            margin: EdgeInsets.only(top: 30, left: 15),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            alignment: Alignment.center,
            height: 70,
            child: Text(
              '搜索',
              style: TextStyle(
                color: Color(0xFF464EB5),
                fontSize: 14,
              ),
            ),
          ),
          onTap: () {
            // SocketMassge.sendmsg(
            //     '{"msg_type":"search","msg_Username":"${userController.text}"}');
            // SocketMassge.sendmsg('nihao');
          },
        ),
      ],
    );
  }
}

class UsersSearchResultList extends StatefulWidget {
  UsersSearchResultList({Key? key}) : super(key: key);

  @override
  State<UsersSearchResultList> createState() => _UsersSearchResultListState();
}

class _UsersSearchResultListState extends State<UsersSearchResultList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: UsersSearchResult,
    );
  }
}

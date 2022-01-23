import 'dart:async';
import 'package:wechat/UersSelf.dart';

import 'UersChatWight.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(const chat());
}

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ChatUersName = ModalRoute.of(context)!.settings.arguments;
    return MaterialApp(
      color: Color.fromRGBO(214, 214, 214, 1),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            ChatUersName.toString(),
            style: TextStyle(color: Colors.black),
          ),
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
          shadowColor: Colors.transparent,
          centerTitle: true,
        ),
        body: const MYHomeViewContent(),
      ),
    );
  }
}

class MYHomeViewContent extends StatefulWidget {
  const MYHomeViewContent({Key? key}) : super(key: key);

  @override
  _MYHomeViewContentState createState() => _MYHomeViewContentState();
}

class _MYHomeViewContentState extends State<MYHomeViewContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _buildChatContent(),
          _buildBomView(),
        ],
      ),
    );
  }

  ScrollController _scrollController = ScrollController();
  bool isFirst = true;
  ScrollController _controller = ScrollController();

  _buildChatContent() {
    Timer(Duration(milliseconds: 500),
        () => _controller.jumpTo(_controller.position.maxScrollExtent));
    print("build");
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      child: ListView.builder(
          controller: _controller,
          padding: const EdgeInsets.only(left: 9, right: 9, bottom: 9),
          itemBuilder: (context, i) {
            if (isFirst == true) {
              getUersChatList();
              isFirst = false;
              print(isFirst);
            } else {
              uersList.add(UersChatWidght_UersSelf(
                  sendMassge.toString(), "assetImage/Mao-CreateIcon.jpg"));
            }

            return Stack(children: [
              Column(
                children: uersList,
              )
            ]);
          },
          itemCount: 1),
    );
  }

  TextEditingController userController = TextEditingController();
  String? UersInput;
  String? sendMassge;
  List<Widget> uersList = [];
  List<Widget> lastUersList = [];
  var socket;
  String? TextContent;
  List<Widget> getUersChatList() {
    for (var i = 0; i < 20; i++) {
      uersList
          .add(UersChatWidght_UersSelf("好的", "assetImage/Mao-CreateIcon.jpg"));
      uersList.add(UersChatWidght("出来吹水", "assetImage/Mao-CreateIcon.jpg"));
    }
    return uersList;
  }

  Future<void> NewSocket() async {
    await Socket.connect("192.168.101.84", 80).then((value) {
      this.socket = value;
    });
  }

  ///底部视图
  Widget _buildBomView() {
    this.NewSocket();
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Color.fromRGBO(224, 224, 224, 0.7),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
                constraints: BoxConstraints(
                  maxHeight: 100.0,
                  minHeight: 50.0,
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6FF),
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: TextField(
                  controller: userController,
                  cursorColor: Color(0xFF464EB5),
                  maxLines: null,
                  decoration: InputDecoration(
                    counterText: TextContent,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
                    hintText: "回复",
                    hintStyle:
                        TextStyle(color: Color(0xFFADB3BA), fontSize: 15),
                  ),
                  style: TextStyle(color: Color(0xFF03073C), fontSize: 15),
                  // onChanged: (value) {
                  //   setState(() {
                  //     this.UersInput = value;
                  //   });
                  // },
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.center,
                height: 70,
                child: Text(
                  '发送',
                  style: TextStyle(
                    color: Color(0xFF464EB5),
                    fontSize: 14,
                  ),
                ),
              ),
              onTap: () {
                _controller.jumpTo(_controller.position.maxScrollExtent);
                setState(() {
                  this.sendMassge = this.userController.text;
                  _buildChatContent();
                  this.userController.text = "";
                });
                print(this.sendMassge);
                this.socket.write(sendMassge);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//3：折叠键盘
void _closeKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  /// 键盘是否是弹起状态
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.height / 1.5, size.width / 2);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

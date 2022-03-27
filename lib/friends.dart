import 'package:flutter/material.dart';
// import 'package:wechat/mainpage.dart';

void main(List<String> args) {
  runApp(FriendPgae());
}

class FriendPgae extends StatefulWidget {
  FriendPgae({Key? key}) : super(key: key);

  @override
  _FriendPgaeState createState() => _FriendPgaeState();
}

class _FriendPgaeState extends State<FriendPgae> {
  int _currentIndex = 0;
  List<Widget> UersList = [];
  List<Widget> _GetUersList() {
    for (var i = 0; i < 50; i++) {
      UersList.add(Column(
        children: [
          ListTile(
            leading: Container(
              height: 35,
              width: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assetImage/Mao-CreateIcon.jpg"),
                      fit: BoxFit.fill),
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            title: Text("冯总"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(
            height: 4,
          )
        ],
      ));
    }
    return UersList;
  }

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
          "friends",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: this._GetUersList(),
      ),
    );
  }
}

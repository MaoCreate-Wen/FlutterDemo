import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Cloud());
}

class Cloud extends StatefulWidget {
  Cloud({Key? key}) : super(key: key);

  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
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
          "发现",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
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
                title: Text("发现"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {},
              ),
              Divider(
                height: 4,
              ),
              Container(
                height: 25,
                color: Color.fromRGBO(224, 224, 224, 0.5),
              ),
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
                title: Text("发现"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {},
              ),
              Divider(
                height: 4,
              ),
            ],
          )
        ],
      ),
    );
  }
}

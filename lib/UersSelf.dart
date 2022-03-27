import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(UersSelf());
}

class UersSelf extends StatefulWidget {
  UersSelf({Key? key}) : super(key: key);

  @override
  _UersSelfState createState() => _UersSelfState();
}

class _UersSelfState extends State<UersSelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Container(
              child: Row(
            children: [
              Divider(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assetImage/Mao-CreateIcon.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
              Column(
                children: [
                  Text(
                    "wen",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "微信号：123456",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                width: 90,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right))
            ],
          )),
          Divider(
            height: 5,
          ),
          Container(
            height: 10,
            color: Color.fromRGBO(224, 224, 224, 0.5),
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Icon(Icons.cloud),
              SizedBox(
                width: 15,
              ),
              Text("收藏"),
              SizedBox(
                width: 275,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
          Divider(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Icon(Icons.settings),
              SizedBox(
                width: 15,
              ),
              Text("设置"),
              SizedBox(
                width: 275,
              ),
              Icon(Icons.chevron_right)
            ],
          )
        ],
      ),
    );
  }
}

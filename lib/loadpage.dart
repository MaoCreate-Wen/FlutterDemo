import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat/main.dart';
import 'package:wechat/mainpage.dart';

void main(List<String> args) {
  runApp(loadPage());
}

class loadPage extends StatefulWidget {
  loadPage({Key? key}) : super(key: key);

  @override
  State<loadPage> createState() => _loadPageState();
}

class _loadPageState extends State<loadPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {"/mainpage": (context) => LoginPage()},
        home: sss());
  }
}

class sss extends StatefulWidget {
  sss({Key? key}) : super(key: key);

  @override
  State<sss> createState() => _sssState();
}

class _sssState extends State<sss> {
  @override
  Widget _mainpage() {
    Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushNamed("/mainpage"));
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assetImage/qiyuanicon.png"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              width: 500,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assetImage/maocreateicon.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: this._mainpage(),
    );
  }
}

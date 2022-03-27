import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:wechat/UersData/UersList.dart';

class SocketMassge with ChangeNotifier {
  String Data = "";
  static var socketcli;
  ConnectServer() async {
    socketcli = await Socket.connect("192.168.101.84", 80);
    utf8.decoder.bind(socketcli).listen((data) {
      Data = data;
      print(Data);
      notifyListeners();
    });
  }

  void sendmsg(String data) async {
    socketcli.writeln(data);
    print(data);
  }

  void close() {
    socketcli!.close();
  }
}

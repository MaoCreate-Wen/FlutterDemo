import 'dart:convert';
import 'dart:io';

String? Data;
void main(List<String> args) async {
  var socket = Socket.connect("192.168.101.84", 80).then((value) async {
    print("connect run");
    utf8.decoder.bind(value).listen((data) {
      // print("listen data");
      Data = data.toString();
      print(Data);
    });
    String data = '{"msg_type":"ListenAddr"}';
    value.write(data);
  });
}

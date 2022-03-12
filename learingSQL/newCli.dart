import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  var socket = await Socket.connect("192.168.101.84", 80);
  socket.writeln('{"msg_type":"search","msg_Username":"user01"}');
  await socket.flush(); //发送
  //读取返回内容
  utf8.decoder.bind(socket).listen((data) {
    var Data = data.toString();
    print(Data);
  });
  // socket.close();
}

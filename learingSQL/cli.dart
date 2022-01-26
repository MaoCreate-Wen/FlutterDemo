import 'dart:io';

void main(List<String> args) {
  Socket.connect("192.168.101.84", 80).then((value) {
    String data = '{"msg_type":"login","msg_content":"111"}';
    value.write(data);
    print(data);
  });
}

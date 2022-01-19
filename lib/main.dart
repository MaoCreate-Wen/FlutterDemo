import 'package:flutter/material.dart';
import 'package:wechat/UersSelf.dart';
import 'wechat.dart';
import 'friends.dart';
import 'cloud.dart';
import 'chat.dart';

void main(List<String> args) {
  runApp(Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"/chat": (context) => chat()},
      home: MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  int _currentIndex = 0;
  late PageController _pageController;
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: this._currentIndex, //默认在第几个
      viewportFraction: 1, // 占屏幕多少，1为占满整个屏幕
      keepPage: true, //是否保存当前 Page 的状态，如果保存，下次回复保存的那个 page，initialPage被忽略，
      //如果为 false 。下次总是从 initialPage 开始。
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/chat": (context) => chat(),
        },
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: this._currentIndex,
            onTap: (index) {
              setState(() {
                this._currentIndex = index;
              });
              this._pageController.jumpToPage(this._currentIndex);
              // setpage();
            },
            items: [
              // BottomNavigationBarItem(
              //     icon: ImageIcon(
              //       AssetImage("assetImage/Mao-CreateIcon.jpg"),
              //       size: 25,
              //     ),
              //     title: Text("wechat")),
              // BottomNavigationBarItem(
              //     icon: ImageIcon(
              //       AssetImage("assetImage/Mao-CreateIcon.jpg"),
              //       size: 25,
              //     ),
              //     title: Text("friends")),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.mode_comment,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.mode_comment,
                  color: Colors.green,
                ),
                title: Text(
                  'wechat',
                  // style: TextStyle(color: Colors.green),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.group,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.group,
                  color: Colors.green,
                ),
                title: Text(
                  'friend',
                  // style: TextStyle(color: Colors.green),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.cloud_queue,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.cloud_queue,
                  color: Colors.green,
                ),
                title: Text(
                  'discover',
                  // style: TextStyle(color: Colors.green),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.accessibility,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.accessibility,
                  color: Colors.green,
                ),
                title: Text(
                  'myself',
                  // style: TextStyle(color: Colors.green),
                ),
              )
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.green,
          ),
          body: PageView(
            controller: this._pageController,
            onPageChanged: (index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            children: [
              Wechat(),
              FriendPgae(),
              Cloud(),
              UersSelf(),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

Widget UersChatWidght(String Textcontent, String ImageAd) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(top: 10, left: 15),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAd),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      Stack(
        children: [
          Positioned(
            top: 25,
            child: ClipPath(
              clipper: TrianglePath(),
              child: Container(
                width: 25,
                height: 20,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              // top: 5,
              child: Container(
            margin: EdgeInsets.only(left: 25, top: 10),
            constraints: BoxConstraints(
              minHeight: 50,
              maxWidth: 500,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              color: Colors.white,
            ),
            // color: Colors.red,
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Text(Textcontent),
          )),
        ],
      ),
    ],
  );
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

class TrianglePath_second extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(12.5, 10);
    path.lineTo(0, 20);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget UersChatWidght_UersSelf(String Textcontent, String ImageAd) {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        Stack(
          children: [
            Positioned(
                // left: 50,
                child: Container(
              margin: EdgeInsets.only(left: 210, top: 10),
              constraints: BoxConstraints(
                minHeight: 50,
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Colors.white,
              ),
              // color: Colors.red,
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(Textcontent),
            )),
          ],
        ),
        ClipPath(
          clipper: TrianglePath_second(),
          child: Container(
            width: 25,
            height: 20,
            color: Colors.white,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          alignment: Alignment(1, 0),
          margin: EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              image: DecorationImage(
                  image: AssetImage(ImageAd), fit: BoxFit.fill)),
        )
      ],
    ),
  );
}

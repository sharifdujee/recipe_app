import 'package:flutter/cupertino.dart';

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, 500);
    path.lineTo(size.width, 0);
    path.close();
    return path;

  }

  @override
  bool ShouldRecclip(CustomClipper<Path> oldClipper){
    return false;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}
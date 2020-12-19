import 'package:flutter/material.dart';

class NewTaskPageTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  NewTaskPageTransition({@required this.animation, @required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ClipOval(
        child: child,
        clipper: MyOvalClipper(animation.value),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}

class MyOvalClipper extends CustomClipper<Rect> {
  final double animationValue;

  MyOvalClipper(this.animationValue);

  Rect getClip(size) {
    final v = animationValue;
    final initLeft = size.width * 0.9;
    final initRight = size.height * 0.9;
    return Rect.fromLTWH(
        -v * initLeft + initLeft - v * (size.width / 2),
        -v * initRight + initRight - v * (size.height / 2),
        size.width * (1 + v),
        size.height * (1 + v));
  }

  bool shouldReclip(_) => true;
}

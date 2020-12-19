import 'package:flutter/material.dart';

class NewTaskPageTransition extends StatelessWidget {
  final Animation<double> _animation;
  final Widget child;

  NewTaskPageTransition({@required animation, @required this.child})
      : _animation =
            CurvedAnimation(parent: animation, curve: Curves.easeInToLinear);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ClipOval(
        child: child,
        clipper: MyOvalClipper(_animation.value),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}

class MyOvalClipper extends CustomClipper<Rect> {
  final double _animationValue;

  MyOvalClipper(this._animationValue);

  Rect getClip(size) {
    final v = _animationValue;
    final initLeft = size.width * 0.9;
    final finalLeft = -size.width / 2;
    final initRight = size.height * 0.9;
    final finalRight = -size.height / 2;

    // When value = 1, it will cancle the init left and right, and will let the final position out
    return Rect.fromLTWH(
        initLeft + v * (finalLeft - initLeft),
        initRight + v * (finalRight - initRight),
        size.width * (1 + v),
        size.height * (1 + v));
  }

  // Reclip at every value of _animationValue
  bool shouldReclip(_) => true;
}

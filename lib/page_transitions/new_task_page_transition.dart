import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class NewTaskPageTransition extends StatelessWidget {
  final Animation<double> _clipAnimation;
  final Animation<Decoration> _colorAnimation;
  final Widget child;

  NewTaskPageTransition({@required animation, @required this.child})
      : _clipAnimation = CurvedAnimation(
            parent: animation, curve: MyCurve.newTaskClipTransition),
        _colorAnimation = DecorationTween(
                begin: BoxDecoration(color: Colors.blue),
                end: BoxDecoration(color: MyColor.white))
            .animate(CurvedAnimation(
                parent: animation, curve: MyCurve.newTaskColorTransition));

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        clipBehavior: Clip.hardEdge,
        clipper: MyOvalClipper(_clipAnimation.value),
        child: DecoratedBoxTransition(
            position: DecorationPosition.background,
            decoration: _colorAnimation,
            child: child));
  }
}

class MyOvalClipper extends CustomClipper<Rect> {
  final double _animationValue;

  MyOvalClipper(this._animationValue);

  Rect getClip(size) {
    final v = _animationValue;
    final initLeft = size.width * 0.85;
    final initTop = size.height * 0.92;
    final finalLeft = -size.width / 2;
    final finalTop = -size.height / 3;

    final initWidth = 42;
    final initHeight = 42;
    final finalWidth = size.height * 2;
    final finalHeight = size.height * 2;

    // When value = 1, it will cancle the init left and right, and will let the final position out
    return Rect.fromLTWH(
      initLeft + v * (finalLeft - initLeft),
      initTop + v * (finalTop - initTop),
      initWidth + v * (finalWidth - initWidth),
      initHeight + v * (finalHeight - initHeight),
    );
  }

  // Reclip at every value of _animationValue
  bool shouldReclip(_) => true;
}

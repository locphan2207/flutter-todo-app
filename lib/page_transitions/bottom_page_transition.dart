import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class BottomPageTransition extends StatelessWidget {
  final Widget child;
  final Animation<Offset> _slideAnimation;
  final Animation<Decoration> _colorAnimation;

  BottomPageTransition({@required animation, @required this.child})
      : _slideAnimation =
            Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(
                CurvedAnimation(
                    parent: animation, curve: MyCurve.drawerOffset)),
        _colorAnimation = DecorationTween(
                begin: BoxDecoration(color: Colors.transparent),
                end: BoxDecoration(color: MyColor.opacityBlack))
            .animate(CurvedAnimation(
                parent: animation,
                curve: MyCurve.bottomPageColorTransition,
                reverseCurve: MyCurve.bottomPageColorTransition.flipped));

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      position: DecorationPosition.background,
      decoration: _colorAnimation,
      child: SlideTransition(position: _slideAnimation, child: child),
    );
  }
}

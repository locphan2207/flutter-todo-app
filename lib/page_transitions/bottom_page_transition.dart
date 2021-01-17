import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class BottomPageTransition extends StatefulWidget {
  final Widget child;
  final ProxyAnimation animation;

  BottomPageTransition({@required this.animation, @required this.child});

  @override
  _BottomPageTransitionState createState() => _BottomPageTransitionState();
}

class _BottomPageTransitionState extends State<BottomPageTransition>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<Decoration> _colorAnimation;
  VoidCallback _listener;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: MyDuration.bottomPageAnimation, vsync: this);
    _slideAnimation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controller, curve: MyCurve.bottomPageSlideTransition));
    _colorAnimation = DecorationTween(
            begin: BoxDecoration(color: Colors.transparent),
            end: BoxDecoration(color: MyColor.opacityBlack))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: MyCurve.bottomPageColorTransition,
            reverseCurve: MyCurve.bottomPageColorTransition.flipped));

    // Update _controller from the page transition animation
    // Page transition animation has 0 duration, so it happens instantly,
    // The reason is I only use it as a signal to let _controller know
    // We cannot use page transition animation directly because we cannot make
    // any change to it, so it has to be done this way in order to allow dragging
    _listener = () {
      if (widget.animation.value == 1.0) {
        _toOpenPosition();
      } else {
        _toClosePosition();
      }
    };
    widget.animation.addListener(_listener);
  }

  @override
  void dispose() {
    widget.animation.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      position: DecorationPosition.background,
      decoration: _colorAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          dragStartBehavior: DragStartBehavior.start,
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          child: widget.child,
        ),
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    // Update _controller from the delta, to allow dragging the element
    final visibleHeight = context.size.height * 0.8;
    _controller.value += -(details.primaryDelta / visibleHeight);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.value < 0.5 || details.primaryVelocity > 1500) {
      _toClosePosition();
      Navigator.pop(context);
    } else {
      _toOpenPosition();
    }
  }

  void _toOpenPosition() {
    _controller.animateTo(1.0, duration: MyDuration.bottomPageAnimation);
  }

  void _toClosePosition() {
    _controller.animateTo(0.0, duration: MyDuration.bottomPageAnimation);
  }
}

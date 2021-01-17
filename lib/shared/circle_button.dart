import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class CircleButton extends StatefulWidget {
  final Function onPressed;
  final Widget child;
  CircleButton({@required this.child, this.onPressed});

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _isBeingPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: _handleTap,
        onTapUp: _handleTap,
        onTapCancel: _handleTap,
        onTap: widget.onPressed,
        child: Opacity(
          opacity: _isBeingPressed ? 0.5 : 1.0,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: MyColor.blueGray, width: 1.5)),
            child: widget.child,
          ),
        ));
  }

  void _handleTap([dynamic tapDetails]) {
    if (tapDetails != null && tapDetails.runtimeType == TapDownDetails) {
      setState(() {
        _isBeingPressed = true;
      });
    } else {
      setState(() {
        _isBeingPressed = false;
      });
    }
  }
}

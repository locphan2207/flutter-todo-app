import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class Button extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;

  Button(
      {this.text,
      this.onPressed,
      this.color = MyColor.lightBlue,
      this.textColor = MyColor.white});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  bool _isBeingPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = _isBeingPressed ? 0.98 : 1.0;
    final decoration = _isBeingPressed
        ? BoxDecoration(
            color: widget.color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(MyRadius.big),
            boxShadow: [
                BoxShadow(
                    color: widget.color.withOpacity(0.2),
                    offset: Offset(0, 2.0),
                    blurRadius: MyRadius.small,
                    spreadRadius: 0.0)
              ])
        : BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(MyRadius.big),
            boxShadow: [
                BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    offset: Offset(0, 5.0),
                    blurRadius: MyRadius.small,
                    spreadRadius: 1.0)
              ]);

    return GestureDetector(
      onTapDown: _handleTap,
      onTapUp: _handleTap,
      onTapCancel: _handleTap,
      onTap: widget.onPressed,
      child: Transform.scale(
        scale: scale,
        child: Container(
            padding: EdgeInsets.all(MySpacing.medium),
            decoration: decoration,
            child: Text(widget.text,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: MyColor.white))),
      ),
    );
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

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class Button extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final double width;
  final double height;

  Button(
      {this.text,
      this.onPressed,
      this.width = MySize.buttonWidth,
      this.height = MySize.buttonHeight,
      this.isLoading = false,
      this.color = MyColor.lightBlue,
      this.textColor = MyColor.white});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  bool _isBeingPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
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
        child: AnimatedContainer(
            duration: MyDuration.buttonContainer,
            height: widget.height,
            // When loading, height = width for circuclar loading
            width: widget.isLoading ? widget.height : widget.width,
            decoration: decoration,
            child: Align(
                alignment: Alignment.center,
                child: widget.isLoading
                    ? SizedBox(
                        height: MySize.buttonLoadingDiameter,
                        width: MySize.buttonLoadingDiameter,
                        child: CircularProgressIndicator(
                            strokeWidth: MySize.loadingStrokeWidth,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(MyColor.white)),
                      )
                    : Text(widget.text,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: MyColor.white)))),
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

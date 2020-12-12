import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class ProgressBar extends StatefulWidget {
  final double ratio;
  final Color accentColor;
  final Color backgroundColor;
  final double height;

  ProgressBar(
      {this.ratio, this.accentColor, this.backgroundColor, this.height});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: MyDuration.progressBarAnimation, vsync: this);
    _sizeAnimation =
        CurvedAnimation(parent: _controller, curve: MyCurve.progressBarSize);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: [
          Container(height: widget.height, color: widget.backgroundColor),
          SizeTransition(
            sizeFactor: _sizeAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: FractionallySizedBox(
              widthFactor: widget.ratio,
              child:
                  Container(height: widget.height, color: widget.accentColor),
            ),
          ),
        ],
      ),
    );
  }
}

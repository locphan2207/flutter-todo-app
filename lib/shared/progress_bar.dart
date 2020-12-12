import 'package:flutter/material.dart';

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

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: [
          Container(height: widget.height, color: widget.backgroundColor),
          FractionallySizedBox(
            widthFactor: widget.ratio,
            child: Container(height: widget.height, color: widget.accentColor),
          ),
        ],
      ),
    );
  }
}

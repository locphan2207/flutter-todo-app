import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class BottomPage extends StatefulWidget {
  final Widget child;

  BottomPage({@required this.child});

  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 1.0,
        child: Container(
          color: MyColor.white,
          child: widget.child,
        ),
      ),
    );
  }
}

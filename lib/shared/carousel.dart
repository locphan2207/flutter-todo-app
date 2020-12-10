import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final double height;
  final List<Widget> children;

  Carousel({this.children, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView(scrollDirection: Axis.horizontal, children: children),
    );
  }
}

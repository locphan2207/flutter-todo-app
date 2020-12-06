import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Widget> children;

  Carousel({this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: children),
    );
  }
}

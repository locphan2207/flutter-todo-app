import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<Widget> children;

  Carousel({this.children});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: widget.children),
    );
  }
}

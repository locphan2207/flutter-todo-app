import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int total;

  CategoryCard({this.title, this.total});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: 200,
        child: Card(child: Column(children: [Text('$total'), Text(title)])));
  }
}

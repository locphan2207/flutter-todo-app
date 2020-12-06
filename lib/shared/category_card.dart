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
        child: Card(
            borderOnForeground: false,
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$total tasks'),
                    Text(title, style: Theme.of(context).textTheme.headline6)
                  ]),
            )));
  }
}

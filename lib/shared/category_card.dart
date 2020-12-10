import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int total;

  CategoryCard({this.title, this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
      ), // to show box shadow
      child: SizedBox(
          width: MySize.categoryCardWidth,
          child: Card(
              borderOnForeground: false,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              margin: EdgeInsets.only(
                  left: MySpacing.medium,
                  top: MySpacing.small,
                  bottom: MySpacing.small),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MyRadius.medium)),
              child: Padding(
                padding: EdgeInsets.all(MySpacing.medium),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$total tasks',
                          style: Theme.of(context).textTheme.subtitle2),
                      Text(title, style: Theme.of(context).textTheme.headline3)
                    ]),
              ))),
    );
  }
}

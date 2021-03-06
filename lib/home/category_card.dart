import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/shared/progress_bar.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int total;
  final int done;
  final Color color;

  CategoryCard({this.title, this.total, this.done, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
      ), // to show box shadow
      child: SizedBox(
          width: MySize.categoryCardWidth,
          child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.only(
                  left: MySpacing.medium,
                  top: MySpacing.small,
                  bottom: MySpacing.small),
              decoration: BoxDecoration(
                color: MyColor.trueWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(MyRadius.medium),
                boxShadow: [
                  BoxShadow(
                    color: MyColor.shadow,
                    offset: Offset(0, 12.0),
                    blurRadius: MyRadius.small,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(MySpacing.medium),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('$total tasks',
                          style: Theme.of(context).textTheme.subtitle2),
                      Text(title, style: Theme.of(context).textTheme.headline3),
                      ProgressBar(
                          ratio: total == 0 ? 0.0 : done / total,
                          accentColor: color,
                          backgroundColor: MyColor.blueGray,
                          height: MySize.progressBarHeight),
                    ]),
              ))),
    );
  }
}

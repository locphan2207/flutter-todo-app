import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class TaskCard extends StatelessWidget {
  final String taskString;
  final Color color;

  TaskCard(this.taskString, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyRadius.medium),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(bottom: MySpacing.small),
        padding: EdgeInsets.symmetric(
            vertical: MySpacing.xMedium, horizontal: MySpacing.medium),
        child: Row(
          children: [
            Container(
                height: MySize.taskCircle,
                width: MySize.taskCircle,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: color))),
            SizedBox(width: MySpacing.medium),
            Flexible(
                child: Text(taskString,
                    style: Theme.of(context).textTheme.bodyText1)),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class TaskCard extends StatelessWidget {
  final String taskString;

  TaskCard(this.taskString);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyRadius.medium),
          color: Colors.black12,
        ),
        margin: EdgeInsets.symmetric(vertical: MySpacing.small),
        padding: EdgeInsets.all(MySpacing.medium),
        child: Row(
          children: [
            Icon(Icons.circle),
            Text(taskString, style: Theme.of(context).textTheme.bodyText1),
          ],
        ));
  }
}

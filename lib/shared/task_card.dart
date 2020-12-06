import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskString;

  TaskCard(this.taskString);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(Icons.circle),
            Text(taskString, style: Theme.of(context).textTheme.bodyText1),
          ],
        ));
  }
}

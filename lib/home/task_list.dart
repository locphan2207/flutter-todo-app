import 'package:flutter/material.dart';
import 'package:flutter_todo_app/shared/task_card.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('YOUR TASKS', style: Theme.of(context).textTheme.subtitle1),
        Flexible(
          fit: FlexFit.loose,
          child: ListView(
            children: [
              TaskCard('Do something'),
              TaskCard('Make something'),
              TaskCard('Go to this place'),
              TaskCard('Make sure to practise this thing'),
              TaskCard('Buy this from the market'),
              TaskCard('Call someone to remind about something'),
              TaskCard('Call someone to remind about something'),
              TaskCard('Call someone to remind about something'),
            ],
          ),
        ),
      ],
    );
  }
}

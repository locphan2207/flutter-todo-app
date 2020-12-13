import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/home/task_card.dart';

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
            padding: EdgeInsets.symmetric(vertical: MySpacing.medium),
            children: [
              TaskCard('Do something', Colors.pink),
              TaskCard('Make something', Colors.pink),
              TaskCard('Go to this place', Colors.lightBlue),
              TaskCard('Make sure to practise this thing', Colors.lightBlue),
              TaskCard('Buy this from the market', Colors.pink),
              TaskCard(
                  'Call someone to remind about something', Colors.lightBlue),
              TaskCard(
                  'Call someone to remind about something for someone yeah',
                  Colors.pink),
              TaskCard('Call someone to remind about something', Colors.pink),
            ],
          ),
        ),
      ],
    );
  }
}

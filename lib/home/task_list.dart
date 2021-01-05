import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/home/task_card.dart';
import 'package:flutter_todo_app/services.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
    dbService.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final list = StreamBuilder(
        stream: dbService.todosStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading...');
          }

          final todos = snapshot.data;

          if (todos.isEmpty) {
            return Text('Create a new todo using the button below');
          }

          return Flexible(
            fit: FlexFit.loose,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: MySpacing.medium),
              children: todos
                  // TODO: need to fetch categories to know which color belongs to which category
                  .map((todo) => TaskCard(todo['body'], Colors.pink))
                  .toList(),
            ),
          );
        });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('YOUR TASKS', style: Theme.of(context).textTheme.subtitle1),
        list,
      ],
    );
  }
}

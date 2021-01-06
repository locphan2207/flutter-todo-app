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
    final list = StreamBuilder<Map>(
        stream: dbService.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading...');
          }

          final todosMap = snapshot.data['todos'];
          final categoriesMap = snapshot.data['categories'];

          if (todosMap == null || categoriesMap == null) {
            return Text('Loading...');
          }

          final todos = todosMap.values;
          if (todos.isEmpty) {
            return FlatButton(
                onPressed: () => dbService.createTodo('hello', 1),
                child: Text('Create a new todo using the button below'));
          }

          return Flexible(
            fit: FlexFit.loose,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: MySpacing.medium),
              children: todos.map<Widget>((todo) {
                final colorName = categoriesMap[todo['category_id']]['color'];
                final color = MyColor.categoryColors[colorName];
                return TaskCard(todo['body'], color);
              }).toList(),
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

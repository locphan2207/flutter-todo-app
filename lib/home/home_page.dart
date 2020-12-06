import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home/task_list.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/shared/app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(),
              Text('What\'s up, Tan Loc',
                  style: Theme.of(context).textTheme.headline4),
              CategoryCarousel(),
              Expanded(child: TaskList()),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('hello'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

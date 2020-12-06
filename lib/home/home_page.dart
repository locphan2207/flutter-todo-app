import 'package:flutter/material.dart';
import 'package:flutter_todo_app/shared/app_bar.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyAppBar(),
              Text('What\'s up, Tan Loc',
                  style: Theme.of(context).textTheme.headline4),
              CategoryCarousel(),
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

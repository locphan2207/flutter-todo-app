import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home/task_list.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:flutter_todo_app/shared/app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final AppModel appModel;
  HomePage({Key key, this.appModel}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    print('init');
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat();
    _offsetAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(0.5, 0.0))
        .animate(_controller);
    print(_offsetAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;

    return AnimatedBuilder(
      child: Scaffold(
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
      ),
      animation: _controller,
      builder: (_, homeWidget) {
        return SlideTransition(
          position: _offsetAnimation,
          child: homeWidget,
        );
      },
    );
  }
}

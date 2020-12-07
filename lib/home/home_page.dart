import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home/task_list.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:flutter_todo_app/shared/app_bar.dart';

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
    _controller = AnimationController(
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 400),
        vsync: this);
    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.8, 0.0)).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOutCubic,
                reverseCurve: Curves.easeOutCubic.flipped));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    var isDrawerOpen = widget.appModel.isDrawerOpen;
    if (isDrawerOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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

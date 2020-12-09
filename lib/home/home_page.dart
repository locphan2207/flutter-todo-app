import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home/task_list.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:flutter_todo_app/shared/app_bar.dart';
import 'package:flutter_todo_app/constants.dart';

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
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: MyDurations.drawerAnimation,
        reverseDuration: MyDurations.drawerAnimation,
        vsync: this);
    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.7, 0.0)).animate(
            CurvedAnimation(
                parent: _controller,
                curve: MyCurves.drawerOffset,
                reverseCurve: MyCurves.drawerOffset.flipped));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
        CurvedAnimation(
            parent: _controller,
            curve: MyCurves.drawerScale,
            reverseCurve: MyCurves.drawerScale));
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
    return AnimatedBuilder(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        child: Scaffold(
          body: SafeArea(
            child: Center(
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('hello'),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
      animation: _controller,
      builder: (_, homeWidget) {
        return SlideTransition(
            position: _offsetAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: homeWidget,
            ));
      },
    );
  }
}

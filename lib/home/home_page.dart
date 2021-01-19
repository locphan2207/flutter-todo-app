import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home/task_list.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/category_carousel.dart';
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
  final _dbService = DatabaseService();
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _dbService.fetchData();
    _controller = AnimationController(
        duration: MyDuration.drawerAnimation,
        reverseDuration: MyDuration.drawerAnimation,
        vsync: this);
    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.7, 0.0)).animate(
            CurvedAnimation(
                parent: _controller,
                curve: MyCurve.drawerOffset,
                reverseCurve: MyCurve.drawerOffset.flipped));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
        CurvedAnimation(
            parent: _controller,
            curve: MyCurve.drawerScale,
            reverseCurve: MyCurve.drawerScale));
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
    void navigateToNewtask() {
      Navigator.pushNamed(context, MyRoute.newTask);
    }

    var child = ClipRRect(
      borderRadius: BorderRadius.circular(MyRadius.device),
      child: Scaffold(
        backgroundColor: MyColor.white,
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MySpacing.medium),
                  child: Text('What\'s up, Tan Loc!',
                      style: Theme.of(context).textTheme.headline2),
                ),
                SizedBox(height: MySpacing.medium),
                CategoryCarousel(),
                SizedBox(height: MySpacing.medium),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MySpacing.medium),
                  child: TaskList(),
                )),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: navigateToNewtask,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );

    return SlideTransition(
      position: _offsetAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: child,
      ),
    );
  }
}

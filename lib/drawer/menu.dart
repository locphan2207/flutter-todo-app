import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/models/app_model.dart';

class Menu extends StatefulWidget {
  final AppModel appModel;

  Menu({Key key, this.appModel}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: MyDurations.menuAnimation,
        reverseDuration: MyDurations.menuAnimation,
        vsync: this);
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: MyCurves.menuOffset));
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
    var nameStyle =
        Theme.of(context).textTheme.headline4.copyWith(color: MyColors.white);
    var itemStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(color: MyColors.white);

    return AnimatedBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tan Loc', style: nameStyle),
            Text('Phan', style: nameStyle),
            Text('Templates', style: itemStyle),
            Text('Categories', style: itemStyle),
            Text('Analytics', style: itemStyle),
            Text('Settings', style: itemStyle),
          ],
        ),
        animation: _controller,
        builder: (_, menuWidget) {
          return SlideTransition(position: _offsetAnimation, child: menuWidget);
        });
  }
}

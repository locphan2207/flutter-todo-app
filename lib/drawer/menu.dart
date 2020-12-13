import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/drawer/menu_option.dart';
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
        duration: MyDuration.menuAnimation,
        reverseDuration: MyDuration.menuAnimation,
        vsync: this);
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: MyCurve.menuOffset));
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
    var nameStyle = Theme.of(context)
        .textTheme
        .headline1
        .copyWith(color: MyColor.trueWhite);

    final options = [
      ['Categories', Icons.label_outline],
      ['Done List', Icons.fact_check_outlined],
      ['Settings', Icons.settings_outlined],
    ].map((option) => MenuOption(text: option[0], icon: option[1])).toList();

    return Container(
      color: MyColor.trueBlack,
      padding: EdgeInsets.symmetric(
          horizontal: MySpacing.xMedium, vertical: MySpacing.medium),
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, menuWidget) {
            return SlideTransition(
                position: _offsetAnimation, child: menuWidget);
          },
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tan Loc', style: nameStyle),
                  Text('Phan', style: nameStyle),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: MySpacing.big),
                      child: Column(children: options)),
                ]),
          ),
        ),
      ),
    );
  }

  void handleTap() {}
}

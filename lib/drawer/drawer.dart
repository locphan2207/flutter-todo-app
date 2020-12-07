import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/models/app_model.dart';

class Menu extends StatefulWidget {
  final AppModel appModel;

  Menu({Key key, this.appModel}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var nameStyle =
        Theme.of(context).textTheme.headline4.copyWith(color: MyColors.white);
    var itemStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(color: MyColors.white);

    return Column(
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
    );
  }
}

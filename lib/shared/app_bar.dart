import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: Provider.of<AppModel>(context, listen: false).toggleDrawer,
          splashRadius: 24.0,
        ),
        Row(
          children: [
            Icon(Icons.search),
            Icon(Icons.notifications_none_rounded)
          ],
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}

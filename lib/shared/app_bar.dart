import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.menu_rounded),
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

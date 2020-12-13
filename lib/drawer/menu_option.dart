import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class MenuOption extends StatelessWidget {
  final String text;
  final IconData icon;

  MenuOption({@required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    var itemStyle =
        Theme.of(context).textTheme.headline5.copyWith(color: MyColor.white);

    return GestureDetector(
      onTap: () => print('h'),
      child: Padding(
        padding: EdgeInsets.all(MySpacing.small),
        child: Row(children: [
          Icon(icon, color: MyColor.white, size: 24),
          SizedBox(width: MySpacing.small),
          Text(text, style: itemStyle)
        ]),
      ),
    );
  }
}

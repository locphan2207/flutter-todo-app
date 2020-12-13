import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class MenuOption extends StatefulWidget {
  final String text;
  final IconData icon;

  MenuOption({@required this.text, this.icon});

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  bool _isBeingPressed = false;

  @override
  Widget build(BuildContext context) {
    final color = _isBeingPressed ? MyColor.lightGray : MyColor.white;
    final itemStyle =
        Theme.of(context).textTheme.headline5.copyWith(color: color);

    return GestureDetector(
      onTapDown: handleTap,
      onTapUp: handleTap,
      child: Padding(
        padding: EdgeInsets.all(MySpacing.small),
        child: Row(children: [
          Icon(widget.icon, color: MyColor.darkGray, size: 26),
          SizedBox(width: MySpacing.medium),
          Text(widget.text, style: itemStyle)
        ]),
      ),
    );
  }

  void handleTap(dynamic tapDetails) {
    if (tapDetails.runtimeType == TapDownDetails) {
      setState(() {
        _isBeingPressed = true;
      });
    } else {
      setState(() {
        _isBeingPressed = false;
      });
    }
  }
}

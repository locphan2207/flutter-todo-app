import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class MenuOption extends StatefulWidget {
  final String text;
  final IconData icon;
  final String route;

  MenuOption({@required this.text, @required this.route, this.icon});

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

    void _handleTap(dynamic tapDetails) {
      if (tapDetails.runtimeType == TapDownDetails) {
        setState(() {
          _isBeingPressed = true;
        });
      } else {
        setState(() {
          _isBeingPressed = false;
        });
        Navigator.pushNamed(context, widget.route);
      }
    }

    return GestureDetector(
      onTapDown: _handleTap,
      onTapUp: _handleTap,
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
}

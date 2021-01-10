import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class ColorPicker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String _chosenColor;

  @override
  void initState() {
    super.initState();
    _chosenColor = MyColor.categoryColors.keys.first;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: MyColor.categoryColors.entries.map<Widget>((entry) {
          final name = entry.key;
          final color = entry.value;
          final isChosen = name == _chosenColor;
          return GestureDetector(
            onTap: () {
              setState(() {
                _chosenColor = name;
              });
            },
            child: Container(
                margin: EdgeInsets.all(MySpacing.medium),
                height: MySize.colorCircle,
                width: MySize.colorCircle,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: isChosen
                        ? Border.all(width: 2, color: MyColor.darkGray)
                        : null)),
          );
        }).toList());
  }
}

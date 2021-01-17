import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/shared/wheel_picker.dart';

class ColorPicker extends StatelessWidget {
  final Function onChosenColorChanged;
  ColorPicker({this.onChosenColorChanged});

  @override
  Widget build(BuildContext context) {
    final children = MyColor.categoryColors.values.map<Widget>((color) {
      return Container(
          height: MySize.colorCircle,
          width: MySize.colorCircle,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color));
    }).toList();

    return WheelPicker(
        onSelectedItemChanged: (idx) {
          final name = MyColor.categoryColors.keys.elementAt(idx);
          onChosenColorChanged(name);
        },
        height: MySize.colorCircle * 4,
        width: MediaQuery.of(context).size.width,
        itemExtent: MySize.colorCircle * 1.3,
        children: children);
  }
}

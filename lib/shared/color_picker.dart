import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class ColorPicker extends StatefulWidget {
  final Function onTap;

  ColorPicker({this.onTap});

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
    final colors = MyColor.categoryColors.entries.map<Widget>((entry) {
      final name = entry.key;
      final color = entry.value;
      final isChosen = name == _chosenColor;
      return Container(
          height: MySize.colorCircle,
          width: MySize.colorCircle,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: isChosen
                  ? Border.all(width: 2, color: MyColor.darkGray)
                  : null));
    }).toList();

    return SizedBox(
        height: MySize.colorCircle * 4,
        width: MediaQuery.of(context).size.width,
        child: ListWheelScrollView(
            onSelectedItemChanged: (idx) {
              final name = MyColor.categoryColors.keys.elementAt(idx);
              setState(() {
                _chosenColor = name;
              });
              widget.onTap(name);
            },
            itemExtent: MySize.colorCircle * 1.5,
            diameterRatio: 0.8,
            children: colors));
  }
}

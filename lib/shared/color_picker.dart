import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class ColorPicker extends StatefulWidget {
  final Function onSelectedItemChanged;

  ColorPicker({this.onSelectedItemChanged});

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
        width: 500,
        padding: EdgeInsets.symmetric(vertical: MySpacing.tiny),
        decoration: BoxDecoration(
            color: isChosen ? MyColor.blueGray : null,
            borderRadius: BorderRadius.circular(MyRadius.small)),
        child: Container(
            height: MySize.colorCircle,
            width: MySize.colorCircle,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: isChosen
                    ? Border.all(width: 2, color: MyColor.darkGray)
                    : null)),
      );
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
              widget.onSelectedItemChanged(name);
            },
            itemExtent: MySize.colorCircle * 1.3,
            children: colors));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class WheelPicker extends StatefulWidget {
  final Function onSelectedItemChanged;
  final List<Widget> children;
  final double itemExtent;
  final double height;
  final double width;

  WheelPicker(
      {@required this.children,
      @required this.itemExtent,
      this.height,
      this.width,
      this.onSelectedItemChanged});

  @override
  _WheelPickerState createState() => _WheelPickerState();
}

class _WheelPickerState extends State<WheelPicker> {
  int _chosenIdx = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = widget.children.asMap().entries.map<Widget>((entry) {
      final currIdx = entry.key;
      final child = entry.value;
      final isChosen = currIdx == _chosenIdx;
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            vertical: MySpacing.small, horizontal: MySpacing.medium),
        decoration: BoxDecoration(
            color: isChosen ? MyColor.blueGray : null,
            borderRadius: BorderRadius.circular(MyRadius.small)),
        child: child,
      );
    }).toList();

    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: ListWheelScrollView(
            onSelectedItemChanged: (idx) {
              setState(() {
                _chosenIdx = idx;
              });
              widget.onSelectedItemChanged(idx);
            },
            itemExtent: widget.itemExtent,
            children: children));
  }
}

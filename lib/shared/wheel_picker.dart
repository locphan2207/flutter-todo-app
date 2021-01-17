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
        padding: EdgeInsets.all(MySpacing.medium),
        margin: EdgeInsets.symmetric(horizontal: MySpacing.small),
        decoration: BoxDecoration(
            color: isChosen ? MyColor.lightBlueGray : null,
            boxShadow: [
              if (isChosen)
                BoxShadow(
                    color: MyColor.lightBlueGray.withOpacity(0.5),
                    offset: Offset(0.0, 5.0),
                    blurRadius: MyRadius.small,
                    spreadRadius: 1.0)
            ],
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

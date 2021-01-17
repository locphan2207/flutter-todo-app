import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/wheel_picker.dart';

class CategoryPicker extends StatefulWidget {
  final Function onChosenCategoryChanged;
  CategoryPicker({this.onChosenCategoryChanged});

  @override
  _CategoryPickerState createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  final _dbService = DatabaseService();
  Iterable<Map> _categories;
  int _chosenId;

  @override
  void initState() {
    super.initState();
    _categories = _dbService.categories;
    _chosenId = _categories.first['id'];
    widget.onChosenCategoryChanged(_chosenId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = _categories.map<Widget>((category) {
      final colorName = category['color'];
      final name = category['name'];
      final color = MyColor.categoryColors[colorName];
      return Row(
        children: [
          Container(
              height: MySize.colorCircle,
              width: MySize.colorCircle,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
          SizedBox(width: MySpacing.medium),
          Text(name, style: Theme.of(context).textTheme.headline5),
        ],
      );
    }).toList();

    return WheelPicker(
        onSelectedItemChanged: (idx) {
          final id = _categories.elementAt(idx)['id'];
          widget.onChosenCategoryChanged(id);
        },
        height: MySize.colorCircle * 4,
        width: MediaQuery.of(context).size.width,
        itemExtent: MySize.colorCircle * 1.8,
        children: children);
  }
}

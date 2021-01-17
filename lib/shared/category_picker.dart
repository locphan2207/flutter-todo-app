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

  @override
  void initState() {
    super.initState();
    _categories = _dbService.categories;
    if (_categories != null && _categories.isNotEmpty) {
      final chosenId = _categories.first['id'];
      widget.onChosenCategoryChanged(chosenId);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_categories == null || _categories.isEmpty) {
      return SizedBox(height: 50, width: 50);
    }

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

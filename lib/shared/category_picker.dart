import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/wheel_picker.dart';

class CategoryPicker extends StatelessWidget {
  final _dbService = DatabaseService();
  final Function onChosenCategoryChanged;
  CategoryPicker({this.onChosenCategoryChanged});

  @override
  Widget build(BuildContext context) {
    final categories = _dbService.categories;
    final children = categories.map<Widget>((category) {
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
          final name = MyColor.categoryColors.keys.elementAt(idx);
          onChosenCategoryChanged(name);
        },
        height: MySize.colorCircle * 4,
        width: MediaQuery.of(context).size.width,
        itemExtent: MySize.colorCircle * 1.3,
        children: children);
  }
}

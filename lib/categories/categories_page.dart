import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';
import 'package:flutter_todo_app/shared/button.dart';
import 'package:flutter_todo_app/shared/color_picker.dart';
import 'package:flutter_todo_app/shared/text_input.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _dbService = DatabaseService();
  final _textInputController = TextEditingController();
  String _chosenColor = MyColor.categoryColors.keys.first;
  String _name;

  @override
  void initState() {
    super.initState();
    _textInputController.addListener(() {
      _name = _textInputController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomPage(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryCarousel(
          inCategoriesPage: true,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MySpacing.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInput(
                  controller: _textInputController,
                  hintText: 'Category name',
                  minLines: 1,
                  maxLines: 2,
                ),
                ColorPicker(onSelectedItemChanged: (String colorName) {
                  _chosenColor = colorName;
                }),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MySpacing.medium, vertical: MySpacing.big),
            child: Button(
                onPressed: () {
                  print('$_name, $_chosenColor');
                  _dbService.createCategory(_name, _chosenColor);
                },
                text: 'Create category'),
          ),
        ),
      ],
    ));
  }
}

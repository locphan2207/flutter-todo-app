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
  final dbService = DatabaseService();
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryCarousel(
          inCategoriesPage: true,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MySpacing.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create a new category',
                  style: Theme.of(context).textTheme.headline3),
              Text('Enter a name',
                  style: Theme.of(context).textTheme.headline5),
              TextInput(
                controller: _textInputController,
                hintText: 'Category name',
                minLines: 1,
                maxLines: 2,
              ),
              Text('Pick a color',
                  style: Theme.of(context).textTheme.headline5),
              ColorPicker(onTap: (String colorName) {
                _chosenColor = colorName;
              }),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: MySpacing.medium),
            child: Button(
                onPressed: () {
                  print('$_name, $_chosenColor');
                  dbService.createCategory(_name, _chosenColor);
                },
                text: 'Create category'),
          ),
        ),
      ],
    ));
  }
}

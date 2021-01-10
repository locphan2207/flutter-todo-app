import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return BottomPage(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: MySpacing.medium),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryCarousel(
                  inCategoriesPage: true,
                ),
                Padding(
                  padding: EdgeInsets.all(MySpacing.medium),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create a new category',
                          style: Theme.of(context).textTheme.headline3),
                      Text('Enter a name',
                          style: Theme.of(context).textTheme.headline5),
                      TextInput(
                        controller: _textInputController,
                        hintText: 'Category name',
                        minLines: 2,
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
                FlatButton(
                    onPressed: () {
                      print('$_name, $_chosenColor');
                      dbService.createCategory(_name, _chosenColor);
                    },
                    child: Text('Create category')),
              ],
            )));
  }
}

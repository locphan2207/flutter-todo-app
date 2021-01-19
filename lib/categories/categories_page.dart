import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/shared/category_carousel.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';
import 'package:flutter_todo_app/shared/button.dart';
import 'package:flutter_todo_app/shared/color_picker.dart';
import 'package:flutter_todo_app/shared/text_input.dart';

class CategoriesPage extends StatefulWidget {
  final bool shouldFocus;

  CategoriesPage({this.shouldFocus = false});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _dbService = DatabaseService();
  final _textInputController = TextEditingController();
  bool _isLoading = false;
  bool _hasDbError = false;
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
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _textInputController.dispose();
    super.dispose();
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
                  autofocus: true,
                  hintText: 'Category name',
                  minLines: 1,
                  maxLines: 2,
                ),
                ColorPicker(onChosenColorChanged: (String colorName) {
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
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });

                  try {
                    await Future.delayed(MyDuration.buttonFakeLoading);
                    await _dbService.createCategory(_name, _chosenColor);
                  } catch (err) {
                    setState(() {
                      _hasDbError = true;
                    });
                  } finally {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                isLoading: _isLoading,
                text: 'Create category'),
          ),
        ),
      ],
    ));
  }
}

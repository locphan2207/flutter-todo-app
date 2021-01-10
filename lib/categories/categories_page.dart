import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/home/category_carousel.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';
import 'package:flutter_todo_app/shared/text_input.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return BottomPage(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: MySpacing.small),
            child: FlatButton(
                onPressed: createRandomCategory,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCarousel(),
                    TextInput(
                      hintText: 'Enter a new category',
                    ),
                  ],
                ))));
  }

  void createRandomCategory() {
    dbService.createCategory('Business', 'pink');
  }
}

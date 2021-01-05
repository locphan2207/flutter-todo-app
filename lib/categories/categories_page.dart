import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';

// TODO: Maybe make this page to just solely for creating new categories
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
                child: Text('CREATE A NEW CATEGORY'))));
  }

  void createRandomCategory() {
    dbService.createCategory('Business', 'pink');
  }
}

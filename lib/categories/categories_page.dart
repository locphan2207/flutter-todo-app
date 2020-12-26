import 'package:flutter/material.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return BottomPage(child: Text("hello"));
  }
}

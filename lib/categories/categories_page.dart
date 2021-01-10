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
            margin: EdgeInsets.symmetric(vertical: MySpacing.medium),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryCarousel(),
                Padding(
                  padding: const EdgeInsets.all(MySpacing.medium),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create a new category',
                          style: Theme.of(context).textTheme.headline3),
                      Text('Enter a name',
                          style: Theme.of(context).textTheme.headline5),
                      TextInput(
                        hintText: 'Category name',
                        minLines: 2,
                        maxLines: 2,
                      ),
                      Text('Pick a color',
                          style: Theme.of(context).textTheme.headline5),
                      Row(
                          children: MyColor.categoryColors.values
                              .map<Widget>((color) => Container(
                                  height: MySize.taskCircle,
                                  width: MySize.taskCircle,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: color)))
                              .toList())
                    ],
                  ),
                ),
              ],
            )));
  }

  void createRandomCategory() {
    dbService.createCategory('Business', 'pink');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/carousel.dart';
import 'package:flutter_todo_app/home/category_card.dart';

class CategoryCarousel extends StatefulWidget {
  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  final dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
    dbService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
        stream: dbService.categoriesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          }
          final categories = snapshot.data;
          print('here $categories');
          if (categories.isEmpty) {
            return FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoute.categories),
                child: Text('Create a new category'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MySpacing.medium),
                child: Text('CATEGORIES',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Carousel(
                height: MySize.categoryCardHeight,
                children: categories
                    .map((category) => CategoryCard(
                        title: category['name'],
                        done: 42,
                        total: 43,
                        color: MyColor.categoryColors[category['color']]))
                    .toList(),
              ),
            ],
          );
        });
  }
}

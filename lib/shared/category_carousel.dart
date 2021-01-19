import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/carousel.dart';
import 'package:flutter_todo_app/home/category_card.dart';

class CategoryCarousel extends StatefulWidget {
  final bool inCategoriesPage;

  CategoryCarousel({this.inCategoriesPage = false});

  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  final _dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final streamBuilder = StreamBuilder<Map<dynamic, dynamic>>(
        stream: _dbService.categoriesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Align(alignment: Alignment.center, child: Text('Loading'));
          }
          final categories = snapshot.data.values;

          if (categories.isEmpty) {
            return Container(
                margin: EdgeInsets.all(MySpacing.big),
                child: widget.inCategoriesPage
                    ? Text('Empty',
                        style: Theme.of(context).textTheme.subtitle1)
                    : FlatButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, MyRoute.categories),
                        child: Text('Create a new category')));
          }

          return Carousel(
            height: MySize.categoryCardHeight,
            children: categories
                .map((category) => CategoryCard(
                    title: category['name'],
                    done: 42,
                    total: 43,
                    color: MyColor.categoryColors[category['color']]))
                .toList(),
          );
        });

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: MySpacing.medium),
          child:
              Text('CATEGORIES', style: Theme.of(context).textTheme.subtitle1)),
      streamBuilder,
    ]);
  }
}

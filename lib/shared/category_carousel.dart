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
        stream: _dbService.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Align(alignment: Alignment.center, child: Text('Loading'));
          }
          final store = snapshot.data;

          final categories = store['categories'].values;
          final todos = store['todos'].values;
          final countMap = _getCountMap(categories, todos);
          print('store $store');
          print('categories $categories');
          print('todos $todos');
          print('countMap $countMap');

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
                .map<Widget>((category) => CategoryCard(
                    title: category['name'],
                    done: countMap[category['id']]['done'],
                    total: countMap[category['id']]['total'],
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

  Map _getCountMap(Iterable<Map> categories, Iterable<Map> todos) {
    final countMap = {};
    for (var category in categories) {
      final id = category['id'];
      countMap[id] = {'total': 0, 'done': 0};
    }

    for (var todo in todos) {
      final categoryId = todo['category_id'];
      countMap[categoryId]['total'] += 1;
      if (todo['done']) countMap[categoryId]['done'] += 1;
    }
    return countMap;
  }
}

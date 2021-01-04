import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/carousel.dart';
import 'package:flutter_todo_app/home/category_card.dart';

const colors = {
  'pink': Colors.pink,
  'lightBlue': Colors.lightBlue,
  'lightGreen': Colors.lightGreen,
  'yellowAccent': Colors.yellowAccent,
};

class CategoryCarousel extends StatefulWidget {
  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  final dbService = DatabaseService();
  Future<List> _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = dbService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: _futureCategories,
        builder: (context, snapshot) {
          print(snapshot);
          print(snapshot.data);
          if (!snapshot.hasData) {
            return Text('Loading');
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
              Carousel(height: MySize.categoryCardHeight, children: <Widget>[
                CategoryCard(
                    title: 'Business', done: 42, total: 43, color: Colors.pink),
                CategoryCard(
                    title: 'Personal',
                    done: 10,
                    total: 44,
                    color: Colors.lightBlue),
                CategoryCard(
                    title: 'Card3',
                    done: 33,
                    total: 45,
                    color: Colors.lightGreen),
                CategoryCard(
                    title: 'Card4',
                    done: 2,
                    total: 23,
                    color: Colors.yellowAccent),
              ]),
            ],
          );
        });
  }
}

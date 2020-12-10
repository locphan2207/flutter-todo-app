import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/shared/carousel.dart';
import 'package:flutter_todo_app/shared/category_card.dart';

class CategoryCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MySpacing.medium),
          child:
              Text('CATEGORIES', style: Theme.of(context).textTheme.subtitle1),
        ),
        Carousel(height: MySize.categoryCardHeight, children: <Widget>[
          CategoryCard(title: 'Card1', total: 43),
          CategoryCard(title: 'Card2', total: 44),
          CategoryCard(title: 'Card3', total: 45),
          CategoryCard(title: 'Card4', total: 23),
        ]),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'shared/colors.dart';
import 'home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return MaterialApp(
      title: 'Noter',
      theme: ThemeData(
        textTheme: textTheme.copyWith(
          headline4: textTheme.headline4.copyWith(
              color: MyColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito'),
          headline5: textTheme.headline5.copyWith(
              color: MyColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito'),
          headline6: textTheme.headline6.copyWith(
              color: MyColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito'),
          subtitle1: textTheme.subtitle1.copyWith(
              color: MyColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito'),
          bodyText1: textTheme.bodyText1.copyWith(
              color: MyColors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito'),
          bodyText2: textTheme.bodyText2.copyWith(
              color: MyColors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito'),
        ),
        visualDensity: VisualDensity.comfortable,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}

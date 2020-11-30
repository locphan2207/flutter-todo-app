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
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSans')),
        visualDensity: VisualDensity.comfortable,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}

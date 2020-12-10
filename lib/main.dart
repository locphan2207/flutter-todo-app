import 'package:flutter/material.dart';
import 'package:flutter_todo_app/drawer/menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:flutter_todo_app/home/home_page.dart';
import 'package:flutter_todo_app/constants.dart';

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
          headline1: TextStyle(
              color: MyColor.black,
              fontSize: 33,
              fontWeight: FontWeight.w700,
              fontFamily: 'Nunito'),
          headline2: TextStyle(
              color: MyColor.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontFamily: 'Nunito'),
          headline3: TextStyle(
              color: MyColor.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              fontSize: 20,
              fontFamily: 'Nunito'),
          headline4: TextStyle(
              color: MyColor.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito'),
          subtitle1: TextStyle(
              color: MyColor.lightGray,
              letterSpacing: 0.5,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Nunito'),
          subtitle2: TextStyle(
              color: MyColor.lightGray,
              letterSpacing: 0.5,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontFamily: 'Nunito'),
          bodyText1: TextStyle(
              color: MyColor.black,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito'),
          bodyText2: TextStyle(
              color: MyColor.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito'),
        ),
        visualDensity: VisualDensity.comfortable,
      ),
      home: Container(
          color: Colors.black12,
          child: ChangeNotifierProvider(
              create: (context) => AppModel(),
              child: Consumer<AppModel>(builder: (_, appModel, __) {
                return Stack(
                  children: [
                    Menu(appModel: appModel),
                    HomePage(appModel: appModel),
                  ],
                );
              }))),
    );
  }
}

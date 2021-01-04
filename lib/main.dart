import 'package:flutter/material.dart';
import 'package:flutter_todo_app/page_transitions/bottom_page_transition.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_todo_app/menu/menu.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:flutter_todo_app/home/home_page.dart';
import 'package:flutter_todo_app/settings/settings_page.dart';
import 'package:flutter_todo_app/new_task/new_task_page.dart';
import 'package:flutter_todo_app/done/done_page.dart';
import 'package:flutter_todo_app/categories/categories_page.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/page_transitions/new_task_page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var mainPage = Container(
        color: MyColor.trueBlack,
        child: ChangeNotifierProvider(
            create: (context) => AppModel(),
            child: Consumer<AppModel>(builder: (_, appModel, __) {
              return Stack(
                children: [
                  Menu(appModel: appModel),
                  HomePage(appModel: appModel),
                ],
              );
            })));

    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        textTheme: fromTextTheme(textTheme),
        visualDensity: VisualDensity.comfortable,
      ),
      home: mainPage,
      onGenerateRoute: ((settings) {
        switch (settings.name) {
          case MyRoute.newTask:
            {
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => NewTaskPage(),
                transitionsBuilder: (_, animation, __, child) =>
                    NewTaskPageTransition(animation: animation, child: child),
                transitionDuration: MyDuration.newTaskAnimation,
              );
            }
            break;
          case MyRoute.categories:
            {
              return PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => CategoriesPage(),
                transitionsBuilder: (_, animation, __, child) =>
                    BottomPageTransition(animation: animation, child: child),
                transitionDuration: MyDuration.zero,
              );
            }
            break;
          case MyRoute.done:
            {
              return PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => DonePage(),
                transitionsBuilder: (_, animation, __, child) =>
                    BottomPageTransition(animation: animation, child: child),
                transitionDuration: MyDuration.zero,
              );
            }
            break;
          case MyRoute.settings:
            {
              return PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => SettingsPage(),
                transitionsBuilder: (_, animation, __, child) =>
                    BottomPageTransition(animation: animation, child: child),
                transitionDuration: MyDuration.zero,
              );
            }
            break;
          default:
            {
              return MaterialPageRoute(builder: (_) => HomePage());
            }
        }
      }),
    );
  }
}

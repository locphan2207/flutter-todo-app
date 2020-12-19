import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_todo_app/menu/menu.dart';
import 'package:flutter_todo_app/models/app_model.dart';
import 'package:flutter_todo_app/home/home_page.dart';
import 'package:flutter_todo_app/settings/settings_page.dart';
import 'package:flutter_todo_app/new_task/new_task_page.dart';
import 'package:flutter_todo_app/done/done_page.dart';
import 'package:flutter_todo_app/categories/categories_page.dart';
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
        title: 'Todo',
        theme: ThemeData(
          textTheme: fromTextTheme(textTheme),
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
        routes: <String, WidgetBuilder>{
          MyRoute.newTask: (BuildContext context) => NewTaskPage(),
          MyRoute.categories: (BuildContext context) => CategoriesPage(),
          MyRoute.done: (BuildContext context) => DonePage(),
          MyRoute.settings: (BuildContext context) => SettingsPage(),
        });
  }
}

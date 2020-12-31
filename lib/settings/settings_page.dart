import 'package:flutter/material.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BottomPage(
      child: Container(
        color: Colors.blue,
        child: Text('settings page'),
      ),
    );
  }
}

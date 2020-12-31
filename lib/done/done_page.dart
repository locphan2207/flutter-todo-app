import 'package:flutter/material.dart';
import 'package:flutter_todo_app/shared/bottom_page.dart';

class DonePage extends StatefulWidget {
  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return BottomPage(
      child: Container(
        child: Text('done'),
      ),
    );
  }
}

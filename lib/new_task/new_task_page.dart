import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: MyDuration.newTaskColorAnimation, vsync: this);

    // controller can start inner widgets init animations
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(child: Text('newtask')),
    );
  }
}

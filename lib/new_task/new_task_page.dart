import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Decoration> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: MyDuration.newTaskColorAnimation, vsync: this);
    _colorAnimation = DecorationTween(
            begin: BoxDecoration(color: Colors.blue),
            end: BoxDecoration(color: MyColor.white))
        .animate(
            CurvedAnimation(parent: _controller, curve: MyCurve.newTaskColor));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      position: DecorationPosition.background,
      decoration: _colorAnimation,
      child: Container(
        child: SafeArea(child: Text('newtask')),
      ),
    );
  }
}

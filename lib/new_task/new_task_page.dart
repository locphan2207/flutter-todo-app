import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/shared/text_input.dart';

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
        duration: MyDuration.newTaskContentAnimation, vsync: this);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var closeButton = Align(
        alignment: Alignment.topRight,
        child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, right: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColor.blueGray, width: 1.5)),
            child: Icon(Icons.close, color: MyColor.black)));
    return Container(
      child: SafeArea(
          child: Column(
        children: [
          NewTaskContentWrapper(
              controller: _controller,
              start: 0.3,
              end: 0.6,
              child: closeButton),
          NewTaskContentWrapper(
              controller: _controller,
              start: 0.5,
              end: 0.8,
              child: TextInput()),
        ],
      )),
    );
  }
}

class NewTaskContentWrapper extends StatelessWidget {
  final AnimationController controller;
  final double start;
  final double end;
  final Widget child;
  final Animation<double> _fadeAnimation;
  final Animation<Offset> _slideAnimation;

  NewTaskContentWrapper(
      {@required this.controller,
      @required this.start,
      @required this.end,
      @required this.child})
      : _slideAnimation = Tween<Offset>(
                begin: Offset(0.0, -0.05), end: Offset.zero)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(start, end, curve: MyCurve.newTaskContent))),
        _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(start, end, curve: MyCurve.newTaskContent)));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(opacity: _fadeAnimation, child: child));
  }
}

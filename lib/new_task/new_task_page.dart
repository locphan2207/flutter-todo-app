import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/services.dart';
import 'package:flutter_todo_app/shared/button.dart';
import 'package:flutter_todo_app/shared/color_picker.dart';
import 'package:flutter_todo_app/shared/text_input.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage>
    with SingleTickerProviderStateMixin {
  final _dbService = DatabaseService();
  final _textInputController = TextEditingController();
  AnimationController _animationController;
  String _taskBody;

  @override
  void initState() {
    super.initState();
    _textInputController.addListener(() {
      _taskBody = _textInputController.text;
    });
    _animationController = AnimationController(
        duration: MyDuration.newTaskContentAnimation, vsync: this);

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var closeButton = Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(top: 10, right: 10),
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(45),
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: MyColor.blueGray, width: 1.5)),
                child: Icon(Icons.close, color: MyColor.black),
              ),
            ),
          ),
        ));

    var createButton = Align(
        alignment: Alignment.bottomRight,
        child: Container(
            margin: EdgeInsets.only(right: MySpacing.medium),
            child: Button(
                onPressed: () {
                  _dbService.createTodo(_taskBody, 1);
                },
                text: 'Create todo')));

    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NewTaskContentWrapper(
            controller: _animationController,
            start: 0.3,
            end: 0.6,
            child: closeButton),
        NewTaskContentWrapper(
          controller: _animationController,
          start: 0.5,
          end: 0.8,
          child: TextInput(hintText: 'Enter a new task'),
        ),
        NewTaskContentWrapper(
            controller: _animationController,
            start: 0.7,
            end: 1.0,
            child: ColorPicker()),
        NewTaskContentWrapper(
          controller: _animationController,
          start: 0.9,
          end: 1.2,
          child: createButton,
        )
      ],
    ));
  }
}

/// This component will allow init animation
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

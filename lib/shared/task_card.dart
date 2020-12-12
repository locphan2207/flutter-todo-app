import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class TaskCard extends StatefulWidget {
  final String taskString;
  final Color color;

  TaskCard(this.taskString, this.color);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isDone = false;

  void handleTap() {
    setState(() {
      _isDone = !_isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyRadius.medium),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(bottom: MySpacing.small),
          padding: EdgeInsets.symmetric(
              vertical: MySpacing.xMedium, horizontal: MySpacing.medium),
          child: Row(
            children: [
              Container(
                  height: MySize.taskCircle,
                  width: MySize.taskCircle,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: widget.color))),
              SizedBox(width: MySpacing.medium),
              Flexible(
                  child: Text(widget.taskString,
                      style: _isDone
                          ? Theme.of(context).textTheme.bodyText1.copyWith(
                                decoration: TextDecoration.lineThrough,
                              )
                          : Theme.of(context).textTheme.bodyText1)),
            ],
          )),
    );
  }
}

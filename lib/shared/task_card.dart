import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class TaskCard extends StatefulWidget {
  final String taskString;
  final Color color;

  TaskCard(this.taskString, this.color);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: MyDuration.taskCardAnimation, vsync: this);
    _sizeAnimation =
        CurvedAnimation(parent: _controller, curve: MyCurve.taskCardSize);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final circle = Container(
        height: MySize.taskCircle,
        width: MySize.taskCircle,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: widget.color)));

    // Cross line animation is done hackily by having another same text widget
    // transitioned from 0 to full size
    final text = Stack(children: [
      Text(widget.taskString,
          softWrap: true, style: Theme.of(context).textTheme.bodyText1),
      SizeTransition(
          axis: Axis.horizontal,
          axisAlignment: -1,
          sizeFactor: _sizeAnimation,
          child: Text(widget.taskString,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: MyColor.lightGray,
                  decoration: TextDecoration.lineThrough)))
    ]);

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        margin: EdgeInsets.only(bottom: MySpacing.small),
        padding: EdgeInsets.symmetric(
            vertical: MySpacing.xMedium, horizontal: MySpacing.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyRadius.medium),
          color: Colors.white,
        ),
        child: Row(
          children: [
            circle,
            SizedBox(width: MySpacing.medium),
            Flexible(child: text),
          ],
        ),
      ),
    );
  }

  void handleTap() {
    _isDone = !_isDone;
    if (_isDone) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}

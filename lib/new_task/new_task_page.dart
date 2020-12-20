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
      child: SafeArea(
          child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: MyColor.blueGray, width: 1.5)),
                  child: Icon(Icons.close, color: MyColor.black))),
          Material(
            child: TextField(
                // maxLength: 100,
                minLines: 1,
                maxLines: 4,
                autofocus: false,
                enableSuggestions: true,
                // maxLengthEnforced: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 30, height: 1.5),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: MyColor.white,
                    hintText: 'Enter a new task',
                    contentPadding: EdgeInsets.all(10),
                    isDense: false)),
          ),
        ],
      )),
    );
  }
}

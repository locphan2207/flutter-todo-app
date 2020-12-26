import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class BottomPage extends StatefulWidget {
  final Widget child;

  BottomPage({@required this.child});

  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 1.0,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(MyRadius.medium)),
          ),
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(
                    top: MySpacing.small, bottom: MySpacing.medium),
                color: MyColor.darkGray,
                child: SizedBox(
                    height: MySize.bottomPageHandleHeight,
                    width: MySize.bottomPageHandleWidth)),
            widget.child
          ]),
        ),
      ),
    );
  }
}

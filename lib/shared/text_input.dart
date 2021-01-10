import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  const TextInput({Key key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // TODO: use controller to control length and draw counter only when it's near max length
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
              hintText: hintText,
              contentPadding: EdgeInsets.all(10),
              isDense: false)),
    );
  }
}

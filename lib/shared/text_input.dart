import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final bool autofocus;
  final FocusNode focusNode;

  const TextInput(
      {Key key,
      this.hintText,
      this.controller,
      this.onSubmitted,
      this.focusNode,
      this.minLines = 1,
      this.maxLines = 4,
      this.autofocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // TODO: use controller to control length and draw counter only when it's near max length
      child: TextField(
          controller: controller,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
          // maxLength: 100,
          minLines: minLines,
          maxLines: maxLines,
          autofocus: autofocus,
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

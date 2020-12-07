import 'package:flutter/material.dart';

class MyColors {
  static const black = Color(0xFF020417);
  static const white = Color(0xFFF4F6FD);
}

class MyCurves {
  static const drawerOffset = Curves.fastOutSlowIn;
  static const drawerScale = Curves.easeInBack;
  static const menuOffset = Interval(0.5, 1, curve: Curves.ease);
}

class MyDurations {
  static const drawerAnimation = Duration(milliseconds: 500);
  static const menuAnimation = Duration(milliseconds: 600);
}

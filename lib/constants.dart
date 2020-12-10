import 'package:flutter/material.dart';

class MyColor {
  static const black = Color(0xFF020417);
  static const white = Color(0xFFF4F6FD);
  static const darkGray = Color(0xFF373B5e);
  static const lightGray = Color(0xFF9D9AB4);
  static const blueGray = Color(0xFFADBAEB);
  static const blue = Color(0xFF2643C4);
  static const purple = Color(0xFFA056C5);
}

class MyCurve {
  static const drawerOffset = Curves.fastOutSlowIn;
  static const drawerScale = Curves.easeInBack;
  static const menuOffset = Interval(0.5, 1, curve: Curves.ease);
}

class MyDuration {
  static const drawerAnimation = Duration(milliseconds: 500);
  static const menuAnimation = Duration(milliseconds: 600);
}

class MySpacing {
  static const small = 8.0;
  static const medium = 16.0;
}

class MyRadius {
  static const small = 8.0;
  static const medium = 16.0;
  static const big = 32.0;
  static const device = 34.0;
}

class MySize {
  static const categoryCardHeight = 150.0;
  static const categoryCardWidth = 200.0;
}

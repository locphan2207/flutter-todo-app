import 'package:flutter/material.dart';

class MyColor {
  static const black = Color(0xFF020417);
  static const trueBlack = Color(0xFF0A0A0A);
  static const white = Color(0xFFF4F6FD);
  static const trueWhite = Color(0xFFFFFFF8);
  static const darkGray = Color(0xFF373B5e);
  static const lightGray = Color(0xFF9D9AB4);
  static const blueGray = Color(0xFFADBAEB);
  static const blue = Color(0xFF2643C4);
  static const purple = Color(0xFFA056C5);

  static const shadow = Color(0x509D9AB4);
}

class MyCurve {
  static const drawerOffset = Curves.fastOutSlowIn;
  static const drawerScale = Curves.easeInBack;
  static const menuOffset = Interval(0.5, 1, curve: Curves.ease);
  static const progressBarSize = Curves.linearToEaseOut;
  static const taskCardSize = Curves.linear;
}

class MyDuration {
  static const drawerAnimation = Duration(milliseconds: 500);
  static const menuAnimation = Duration(milliseconds: 600);
  static const progressBarAnimation = Duration(milliseconds: 1000);
  static const taskCardAnimation = Duration(milliseconds: 100);
}

class MySpacing {
  static const tiny = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const xMedium = 20.0;
  static const big = 32.0;
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

  static const taskCircle = 20.0;

  static const progressBarHeight = 2.5;
}

import 'package:flutter/material.dart';

class MyColor {
  static const black = Color(0xFF020417);
  static const trueBlack = Color(0xFF0A0A0A);
  static const white = Color(0xFFF4F6FD);
  static const trueWhite = Color(0xFFFFFFFF);
  static const darkGray = Color(0xFF373B5e);
  static const lightGray = Color(0xFF9D9AB4);
  static const blueGray = Color(0xFFADBAEB);
  static const blue = Color(0xFF2643C4);
  static const purple = Color(0xFFA056C5);

  static const shadow = Color(0x509D9AB4);

  static const opacityBlack = Color(0xDD000000);
}

class MyCurve {
  static const drawerOffset = Curves.fastOutSlowIn;
  static const drawerScale = Curves.easeInBack;
  static const menuOffset = Interval(0.5, 1, curve: Curves.ease);
  static const progressBarSize = Curves.linearToEaseOut;
  static const taskCardSize = Curves.linear;

  static const newTaskClipTransition = Curves.easeInOut;
  static const newTaskColorTransition =
      Interval(0.3, 0.8, curve: Curves.easeInOut);
  static const newTaskContent = Curves.decelerate;

  static const bottomPageColorTransition =
      Interval(0.3, 0.8, curve: Curves.easeInOut);
}

class MyDuration {
  static const drawerAnimation = Duration(milliseconds: 500);
  static const menuAnimation = Duration(milliseconds: 600);
  static const progressBarAnimation = Duration(milliseconds: 1000);
  static const taskCardAnimation = Duration(milliseconds: 100);

  static const newTaskAnimation = Duration(milliseconds: 500);
  static const newTaskContentAnimation = Duration(milliseconds: 1500);
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

  static const bottomPageHandleHeight = 3.0;
  static const bottomPageHandleWidth = 100.0;
}

TextTheme fromTextTheme(textTheme) {
  return textTheme.copyWith(
    headline1: TextStyle(
        color: MyColor.black,
        fontSize: 36,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito'),
    headline2: TextStyle(
        color: MyColor.black,
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito'),
    headline3: TextStyle(
        color: MyColor.black,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        fontFamily: 'Nunito'),
    headline4: TextStyle(
        color: MyColor.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Nunito'),
    headline5: TextStyle(
        color: MyColor.black,
        letterSpacing: 0.5,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'Nunito'),
    subtitle1: TextStyle(
        color: MyColor.lightGray,
        letterSpacing: 1.0,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito'),
    subtitle2: TextStyle(
        color: MyColor.lightGray,
        letterSpacing: 0.5,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito'),
    bodyText1: TextStyle(
        color: MyColor.black,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Nunito'),
    bodyText2: TextStyle(
        color: MyColor.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Nunito'),
  );
}

class MyRoute {
  static const newTask = '/new-task';
  static const categories = '/categories';
  static const done = '/done';
  static const settings = '/settings';
}

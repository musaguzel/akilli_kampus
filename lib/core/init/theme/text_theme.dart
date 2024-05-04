import 'package:flutter/material.dart';

class MyTextTheme {
  MyTextTheme._init();

  static MyTextTheme? _instance;

  static MyTextTheme? get instance {
    _instance ??= MyTextTheme._init();
    return _instance;
  }

  static const FONT = "tailu";

  final TextStyle headline1 = const TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  final TextStyle headline2 = const TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      fontFamily: FONT);
  final TextStyle headline3 = const TextStyle(
      fontSize: 48, fontWeight: FontWeight.w400, fontFamily: FONT);
  final TextStyle headline4 = const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      fontFamily: FONT);
  final TextStyle headline5 = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w400, fontFamily: FONT);

  final TextStyle overline = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,color: Colors.white);

  final TextStyle buttonTextStyle2 = const TextStyle(
    fontSize: 17,
    color: Colors.white,
  );
  final TextStyle buttonTextStyle1 = const TextStyle(
    fontSize: 13,
    color: Colors.white,
  );

  //LOGIN
  final TextStyle lucky = const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    fontFamily: FONT,
    color: Color(0xffE86CAB),
  );
  final TextStyle skin = const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    fontFamily: FONT,
    color: Colors.white
  );

  //MAIN
  final TextStyle luckyAppbarTitle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    fontFamily: FONT,
    color: Color(0xffE86CAB),
  );
  final TextStyle skinAppbarTitle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    fontFamily: FONT,
    color: Colors.white
  );

  //HOME
  final TextStyle newsListSubtitle = const TextStyle(
    fontSize: 3,
    color: Colors.white,
  );
  final TextStyle newsListReadMore = const TextStyle(
    fontSize: 12,
    color: Colors.red
  );
}

import 'package:flutter/material.dart';
class CustomColorScheme {

  CustomColorScheme._init();
  static CustomColorScheme? _instace;
  static CustomColorScheme? get instance {
    _instace ??= CustomColorScheme._init();
    return _instace;
  }

  final Color openPink = const Color(0xffE86CAB);

}
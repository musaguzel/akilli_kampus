import 'package:flutter/material.dart';

final MyAppTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor:Colors.white,
    // Açık tema arkaplan rengi
    scaffoldBackgroundColor: Colors.white,
    // Açık tema card widget tarzı widgetlerin rengi
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFC9D5E1), // Açık tema buton rengi
      secondary: Color(0xffCCD7E3)
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF000000)), // Açık tema yazı rengi
      bodyMedium: TextStyle(color: Color(0xFF000000)), // Açık tema yazı rengi
    ),
    appBarTheme:  const AppBarTheme(
      foregroundColor: Colors.indigo,
      backgroundColor: Colors.transparent, // AppBar rengi
      elevation: 0
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF3C3288)))),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white, elevation: 3),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xFF3C3288)),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF4E4CCA), // Buton rengi
      textTheme: ButtonTextTheme.primary, // Buton içindeki metin rengi
    ),
    tabBarTheme: const TabBarTheme(labelColor: Color(0xFF4E4CCA))
,drawerTheme:  DrawerThemeData(
  backgroundColor: Colors.white,
));




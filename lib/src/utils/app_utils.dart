import 'package:dro_health_care/src/utils/constants.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Proxima",
    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        caption: TextStyle(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Constants.droPurple,
      background: Constants.droGrey,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Constants.darkPurple,
      onSecondary: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black),
    iconTheme: IconThemeData(
      color: Colors.blueGrey,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        // fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.blueGrey,
        // fontSize: 18.0,
      ),
    ),
  );
}

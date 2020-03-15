import 'package:flutter/material.dart';

class MyTwitterTheme {
  static String appName = "AthleteOne";
  static String nextWorkoutId = "";
  static String itemId = "";
  static String itemName = "";
  static String imageUrl = "";
  static String fromTab = "";
  static String logsFilePath = "";

  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xff697B89);
  static Color lightBG = Color(0xffffffff);

  static Color cfcPrimary = Colors.lightBlue;
  static Color cfcAccent = lightAccent;

  static Color lightGrey = Color(0x1C1C1E);

  static ThemeData twitterLightTheme = ThemeData(
    primaryColor: cfcPrimary,
    accentColor: cfcAccent,
    textSelectionColor: darkPrimary,
    backgroundColor: lightBG,
    cursorColor: cfcPrimary,
    scaffoldBackgroundColor: lightBG,
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      body1: TextStyle(
        color: Colors.lightBlue,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      body2: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle: TextStyle(
        color: lightAccent,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
    ),
//    appBarTheme: AppBarTheme(
//      color: Colors.black87,
//      iconTheme: IconThemeData(
//        color: Colors.black,
//      ),
//      elevation: 0,
//      textTheme: TextTheme(
//        title: TextStyle(
//          color: cfcPrimary,
//          fontSize: 18.0,
//        ),
//      ),
//    ),
  );

  static ThemeData twitterDarkTheme = ThemeData(
    primaryColor: cfcPrimary,
    accentColor: cfcAccent,
    textSelectionColor: lightBG,
    backgroundColor: darkPrimary,
    cursorColor: cfcPrimary,
    scaffoldBackgroundColor: darkPrimary,
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      body1: TextStyle(
        color: Colors.lightBlue,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      body2: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle: TextStyle(
        color: lightAccent,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
    ),
//    appBarTheme: AppBarTheme(
//      color: Colors.black87,
//      iconTheme: IconThemeData(
//        color: Colors.black,
//      ),
//      elevation: 0,
//      textTheme: TextTheme(
//        title: TextStyle(
//          color: cfcPrimary,
//          fontSize: 18.0,
//        ),
//      ),
//    ),
  );
}

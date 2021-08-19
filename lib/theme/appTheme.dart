import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
              color: Color.fromRGBO(10, 51, 70, 1),
              fontSize: 25,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none),
          headline2: TextStyle(
              color: Color.fromRGBO(10, 51, 70, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
          headline3: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              //decoration: TextDecoration.none
              ),
          headline4: TextStyle(
              color: Color.fromRGBO(10, 51, 70, 1),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none),
          headline5: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
          headline6: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),             
          // bodyText1: TextStyle(
          //   color: Colors.red,
          // ),
          // bodyText2: TextStyle(
          //   color: Colors.black,
          // ),
        ),
    buttonColor: Colors.pinkAccent,
    buttonTheme: ButtonThemeData(
      height: 50,
      minWidth: 250,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textTheme: ButtonTextTheme.accent,
    ),
    hintColor: Colors.black87,
    accentColor: Colors.white,
    errorColor: Colors.pinkAccent,
    highlightColor: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    ),
  );
}

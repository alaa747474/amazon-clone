
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData theme() {
  return ThemeData( 
    fontFamily: 'Dosis',   
   focusColor: const Color.fromARGB(255,6,126,146),
    hintColor: Colors.grey[400],
    backgroundColor: const Color.fromARGB(255,165,230,208),
    primaryColor: const Color.fromARGB(255,129,216,226),
    cardColor: const Color.fromARGB(255,254,216,21),
    scaffoldBackgroundColor: const Color.fromARGB(255, 233, 233, 233),
    shadowColor: Colors.black,
    primaryColorLight: Colors.white,
    textTheme: textTheme(),
  );
}

static TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      height: 1.75,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}
}
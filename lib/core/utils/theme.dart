
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {

  static ThemeData theme() {
  return ThemeData( 
    fontFamily: 'Dosis',   
   focusColor: const Color.fromARGB(255,6,126,146),
    hintColor: Colors.grey[400],
    secondaryHeaderColor: const Color.fromARGB(255,165,230,208),
    primaryColor: const Color.fromARGB(255,129,216,226),
    cardColor: const Color.fromARGB(255,254,216,21),
    scaffoldBackgroundColor: const Color.fromARGB(255, 233, 233, 233),
    shadowColor: Colors.black,
    primaryColorLight: Colors.white,
    highlightColor:const Color.fromARGB(255, 246,207,112),
    textTheme: textTheme(),
  );
}

static TextTheme textTheme() {
  return  TextTheme(
    labelLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 32.sp,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    ),
    titleMedium: TextStyle(
      color:const Color.fromARGB(255,6,126,146),
      fontSize: 16.sp,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 16.sp,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      
      fontSize:16.sp,
    ),
    bodyMedium: TextStyle(
      color: const Color.fromARGB(255,6,126,146),
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
    ),
  );
}
}
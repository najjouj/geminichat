import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
  brightness :Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color(0xffffffff),
    primary:Color(0xff3369ff),
    secondary:Color.fromARGB(255, 240, 231, 231),
  ),
   textTheme: TextTheme(
    titleLarge: TextStyle(
      color:Color(0xff000000)
    )
  )
);

ThemeData darktMode=ThemeData(
  brightness :Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color(0xff000000),
    primary:Color(0xff3369ff),
    secondary:Color.fromARGB(255, 240, 231, 231),
    
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color:Color(0xffffffff)
    )
  )
);
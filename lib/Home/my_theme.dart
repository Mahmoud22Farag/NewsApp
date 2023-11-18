import 'package:flutter/material.dart';

class MyTheme {

  static Color prim = Color(0xff39A552);
  static Color white = Color(0xffffffff);
  static Color red = Color(0xffC91C22);
  static Color darkblue = Color(0xff003E90);
  static Color pink = Color(0xffED1E97);
  static Color brown = Color(0xffCF7E48);
  static Color blue = Color(0xff4882CF);
  static Color yellow = Color(0xffF2D352);
  static Color gray = Color(0xff4F5A69);
  static Color black = Color(0xff303030);


  static ThemeData lighttheme = ThemeData(
    primaryColor: prim,
    appBarTheme: AppBarTheme(
      backgroundColor: prim,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

  );


}

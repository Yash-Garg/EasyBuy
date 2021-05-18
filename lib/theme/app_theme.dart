import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orangeAccent,
  iconTheme: IconThemeData(color: Colors.white),
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.orangeAccent,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(3),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(),
    labelStyle: TextStyle(fontSize: 19),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.orange, width: 2),
    ),
  ),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        focusColor: Colors.black,
        canvasColor: creamColor,
        primaryColor: darkBluishColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: darkBluishColor),
        buttonTheme: ButtonThemeData(
          buttonColor: darkBluishColor,
        ),
        // textTheme: Theme.of(context).textTheme.copyWith(
        //       headline6:
        //           context.textTheme.headline6!.copyWith(color: Colors.black),
        //     ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: TextStyle(color: Colors.black),
        ));
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        focusColor: Colors.white,
        canvasColor: darkCreamColor,
        primaryColor: lightBluishColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: lightBluishColor),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarTextStyle: TextStyle(color: Colors.white),
        ));
  }

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray800;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}

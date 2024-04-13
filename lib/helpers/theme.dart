import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_beat_app/helpers/constants.dart';

ThemeData theme(BuildContext context) {
  TextTheme customTextTheme =
      GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

  return ThemeData(
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: customTextTheme,
    appBarTheme: appBarTheme(),
    useMaterial3: true,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    titleSpacing: 16,
    titleTextStyle: TextStyle(
        fontSize: 14.sp,
        // letterSpacing: 1,

        fontWeight: FontWeight.w500,
        color: textDark),
    // centerTitle: true,
    color: Colors.white,
    elevation: 0,
    // iconTheme: IconThemeData()
    // brightness: Brightness.light,
    // iconTheme: IconThemeData(color: Colors.black),
    // textTheme: TextTheme(

    //   headline6: TextStyle(
    //       // color: Color(0XFF8B8B8B),
    //       color: Colors.black,
    //       letterSpacing: 1,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 21.6),
    // ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xffDFE2E6),
    ),
    gapPadding: 4,
  );
  OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: kPrimary,
    ),
    gapPadding: 16,
  );
  return InputDecorationTheme(
    hintStyle: TextStyle(
      color: textDarkAsh,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
    enabledBorder: outlineInputBorder,
    focusedBorder: focusBorder,
    border: outlineInputBorder,
  );
}

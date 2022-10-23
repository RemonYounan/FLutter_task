import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

final appTheme = ThemeData(
  fontFamily: 'cairo',

  //scaffoldBackgroundColor: AppColorss.white,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      //statusBarColor: AppColorss.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: TextTheme(
      // this fontstyle is for headlines in LoginScreen.
      headlineLarge: TextStyle(
        fontSize: 22.sp, // this means 31px fontSize.
        color: AppColors.lightBlack,
        fontWeight: FontWeight.normal,
      ),
      // this fontstyle is for headlines in VerifyScreen and HelpScreen.
      headlineMedium: TextStyle(
        fontSize: 23.sp, // this means 22px fontSize.
        color: AppColors.white,
        fontWeight: FontWeight.normal,
      ),
      // not usedd yet
      headlineSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      // not used yet
      titleLarge: TextStyle(
        fontSize: 17.sp, // this means 22px fontSize.
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 13.sp, // this means 17px fontSize.
        fontWeight: FontWeight.normal,
        color: AppColors.lightBlack,
      ),
      bodyLarge: TextStyle(
        fontSize: 15.sp,
        color: AppColors.grey,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.5.sp,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 10.sp, // this means 12px fontSize.
        color: AppColors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 8.sp, // this means 10px fontSize.
        color: AppColors.lightBlack,
        fontWeight: FontWeight.normal,
      )),
);

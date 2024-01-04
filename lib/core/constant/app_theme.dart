import 'package:admin/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appLightTheme = ThemeData(
  fontFamily: "Cairo",
  primaryColor: AppColors.primaryColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    titleTextStyle:  TextStyle(
      fontFamily: "Cairo",
      color: AppColors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
    ),
    elevation: 0,
    centerTitle: true,

  ),
  // backgroundColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.black,
    ),
    headline2: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontSize: 19,
    ),
    bodyText1: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontSize: 19,
    ),
    bodyText2: TextStyle(
      height: 1.8,
      color: AppColors.grey,
      fontSize: 17,
    ),
  ),

);

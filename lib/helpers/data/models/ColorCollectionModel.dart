import 'dart:ui';

import 'package:flutter/material.dart';

class ColorCollection {
  final int id;
  final String name;
  // final Color primaryColor;
  final Color textWhite;
  final Color textBlack;
  final Color secondary;
  final Color extra;
  final Color white;
  final Color black;
  final Color grey;
  final Color background;
  final Color graphPrimary;
  final Color textSecondry;
  final Color primary_1;
  final Color primary_2;
  final Color primary_3;
  final Color primary_4;
  final Color primary_5;
  final Color primary_6;
  final Color danger;

  ColorCollection(
      {
      this.danger = Colors.red,
      required this.primary_1,
      required this.primary_2,
      required this.primary_3,
      required this.primary_4,
      required this.primary_5,
      required this.primary_6,
      required this.id,
      required this.secondary,
      required this.background,
      required this.extra,
      required this.name,
      // required this.primaryColor,
      required this.textWhite,
      required this.textBlack,
      required this.white,
      required this.black,
      required this.grey,
      required this.graphPrimary,
      required this.textSecondry});
}


  // static const Color mainUpdatedGreenColor = Color(0xff008080); // primary
  // static const Color mainUpdatedBgColor = Color(0xffF5F5F5); // background
  // static const Color mainUpdatedOrangeColor = Color(0xffFF6F4F);  Secondry
  // static const Color mainUpdatedLightYellowColor = Color(0xffFFFBEB); lightYellow
  // static const Color mainUpdatedLightDarkYellowColor = Color(0xffDBA826);
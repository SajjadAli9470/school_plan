import 'package:flutter/material.dart';
import 'models/themeModel.dart';
class AppTheme {
  AppTheme._();
  
  static Color primary_1 = hexToColor('#1877F2');
  static Color primary_2 = hexToColor('#F8E192');
  static Color primary_3 = hexToColor('#B6E0F3');
  static Color primary_4 = hexToColor('#1877F2');
  static Color primary_5 = hexToColor('#D4F5FF');
  static Color primary_6 = hexToColor('#FF5959');
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static Color blue = Colors.blue;
  static Color green = Colors.green;
  static Color yellow = Colors.yellow;
  static Color red = Colors.red;

  static Color blur = const Color(0xff311d18).withOpacity(0.6);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static String get fontName => 'Poppins';
  static double get Thieght => 1.1;

  static TextTheme get textTheme => TextTheme(
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleSmall: titleSmall,
        bodyMedium: bodyMedium,
        bodyLarge: bodyLarge,
        bodySmall: bodySmall,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        letterSpacing: 0.4,
        height: Thieght,
        color: black,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 0.27,
        color: black,
        height: Thieght,
      );

  static TextStyle get titleLarge => TextStyle(
        // h6 -> title
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 0.1,
        overflow: TextOverflow.ellipsis,
        color: black,
        height: Thieght,
      );
  static TextStyle get titleWhite => TextStyle(
        // h6 -> title
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 0.18,
        height: Thieght,
        overflow: TextOverflow.ellipsis,
        color: white,
      );

  static TextStyle get titleSmall => TextStyle(
      // subtitle2 -> subtitle
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: -0.04,
      height: Thieght,
      overflow: TextOverflow.ellipsis,
      // color: colorAccent,
      color: black);

  static TextStyle get bodyMedium => TextStyle(
      // body1 -> body2
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.2,
      height: Thieght,
      // color: colorAccent,
      color: black);

  static TextStyle get bodyLarge => TextStyle(
      // body2 -> body1
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: -0.05,
      height: Thieght,
      // color: colorAccent,
      color: black);

  static TextStyle get bodySmall => TextStyle(
      // Caption -> caption
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.2,
      height: Thieght,
      // color: colorAccent,
      color: black
      // was lightText
      );
  static TextStyle get miniTextStyle => TextStyle(
        // Caption -> caption
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        fontSize: 8,
        overflow: TextOverflow.ellipsis,
        letterSpacing: 0.2,
        color: black,
        height: Thieght,

        // color: colorAccent, // was lightText
      );

  static BoxDecoration boxDecorationSplash = BoxDecoration(
    boxShadow: const [
      BoxShadow(
        blurRadius: 20.0,
        spreadRadius: 1.0,
        color: Color(0xff30221f),
      ),
    ],
    borderRadius: BorderRadius.circular(20.0),
  );

  static BoxDecoration cardBoxDecoration =  BoxDecoration(
    color: AppTheme.black,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(25.0),
      topRight: Radius.circular(25.0),
    ),
  );

  static BoxDecoration boxDecorationMain =  BoxDecoration(
      gradient: LinearGradient(
          colors: [AppTheme.black, AppTheme.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter));
}

final List<ThemeDataModel> avaliableThemes = [
  ThemeDataModel(
    id: 0,
    background: const Color(0xFFEFEFEF),
    grey: AppTheme.grey,
    white: AppTheme.white,
    black: AppTheme.black,
    name: 'Updated 12 June',
    textWhite: AppTheme.white,
    textBlack: AppTheme.black,
    blue: AppTheme.blue,
    red: AppTheme.red,
    yellow: AppTheme.yellow,
    green: AppTheme.green,
    primary_1: AppTheme.primary_1, // AppTheme.primaryColorPurpule,
    primary_2: AppTheme.primary_2,
    primary_3: AppTheme.primary_3,
    primary_4: AppTheme.primary_4,
    primary_5: AppTheme.primary_5,
    primary_6: AppTheme.primary_6,
  ),
];

Color hexToColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}
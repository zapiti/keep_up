import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_up/app/utils/colors/hex_color_utils.dart';


enum ThemeSize { BIG, MEDIUM, SMALL }
enum ThemeLayoutType { WEB, ANDROID, IOS }

class AppThemeUtils {









  static TextStyle bigBoldSize({Color color,double fontSize = 22}) => GoogleFonts.quicksand(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color ?? black);

  static TextStyle bigSize({Color color, double fontSise = 22}) =>
      GoogleFonts.quicksand(
          decoration: TextDecoration.none, fontSize: fontSise, color: color ?? black);

  static TextStyle normalBoldSize({Color color, double fontSize = 16}) =>
      GoogleFonts.quicksand(
          decoration: TextDecoration.none,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color ?? black);

  static TextStyle normalSize({
    Color color,
    double fontSize = 16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      GoogleFonts.quicksand(
          decoration: decoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color);

  static TextStyle smallSize({Color color, double fontSize = 14}) =>
      GoogleFonts.quicksand(
          decoration: TextDecoration.none, fontSize: fontSize, color: color ?? black);

  static Color colorPrimary = HexColor("1CC2B6");
  static Color colorPrimaryDark = HexColor("00A4D5");
  static Color colorSecundary = HexColor("E78755");
  static var colorSecundary80 = HexColor("CCE78755");
  static var colorSecundary40 = HexColor("66E78755");
  static Color colorTerciaria = HexColor("964015");
  static Color black = HexColor("313534");
  static Color colorPrimary80  = HexColor("CC1CC2B6");
  static Color colorPrimary40  = HexColor("661CC2B6");
  static Color darkGray = HexColor("838685");

  static Color colorsGrey = HexColor("F4F5F5");
  static Color whiteColor = HexColor("FFFFFF");

  static Color colorError = HexColor("CA3838");
  static bool isWeb(BuildContext context) {
    return kIsWeb;
  }
}


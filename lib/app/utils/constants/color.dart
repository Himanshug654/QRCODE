import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  static Color colorPrimary = fromHex("#00AEEF");
  static Color white = fromHex("#ffffff");
  static Color redCellColr = fromHex('#FEE5E5');
  static Color greeCellColr = fromHex('#DEF8DA');
  static Color textfieldBorderColor = fromHex("#DEDEDE");
  static Color textBlack = fromHex("#3D3D3C");
  static Color textBoldBlack = fromHex("#282F39");
  static Color textGray = fromHex("#868592");
  static Color lightTextColor = fromHex("#B9B9B9");
  static Color lightDividerColor = fromHex("#F5F5F5");
  static Color pageViewGrey = fromHex("#B8B8B8");


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

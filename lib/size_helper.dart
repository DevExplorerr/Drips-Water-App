import 'package:flutter/material.dart';

class SizeHelper {
  static const double baseWidth = 375.0; // Figma design width
  static const double baseHeight = 812.0; // Figma design height

  static double fromFigmaWidth(BuildContext context, double myWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (myWidth / baseWidth);
  }

  static double fromFigmaHeight(BuildContext context, double myHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (myHeight / baseHeight);
  }

  static double fromFigmaFontSize(BuildContext context, double figmaFontSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * (figmaFontSize / baseWidth);
}
}

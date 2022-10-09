import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget space({double? height = 10.0, double? width = 10.0}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

TextStyle gSans(
    {double? size, Color? color, FontWeight? fontWeight, double? letterspce}) {
  return GoogleFonts.josefinSans(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterspce,
  );
}

TextStyle popins(
    {double? size, Color? color, FontWeight? fontWeight, double? letterspce}) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterspce,
  );
}

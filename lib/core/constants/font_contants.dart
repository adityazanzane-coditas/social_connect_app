import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontAlata(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color fontColor}) {
  return GoogleFonts.alata(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor,
  );
}

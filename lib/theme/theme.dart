import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
    primaryColor: Colors.grey[200],
    buttonColor: Colors.black.withOpacity(0.9),
    canvasColor: Colors.white);

TextStyle headline =
    GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w600);

TextStyle titleText =
    GoogleFonts.manrope(fontSize: 17, fontWeight: FontWeight.w600);

TextStyle caption = GoogleFonts.manrope(
    fontSize: 14,
    color: appTheme.buttonColor.withOpacity(0.5),
    fontWeight: FontWeight.w600);

TextStyle segmentText =
    GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w600);

TextStyle categoryText = GoogleFonts.manrope(
    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.5);

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
    primaryColor: Colors.green[900],
    buttonColor: Colors.black.withOpacity(0.9),
    canvasColor: Colors.white);

TextStyle headline =
    GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w600);

TextStyle titleText =
    GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w600);

TextStyle caption = GoogleFonts.montserrat(
    fontSize: 11.4,
    color: appTheme.buttonColor.withOpacity(0.5),
    fontWeight: FontWeight.w600);

TextStyle segmentText =
    GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600);
TextStyle descriptionText = GoogleFonts.montserrat(
    color: Colors.grey[700], fontSize: 13.7, fontWeight: FontWeight.w600);

TextStyle categoryText = GoogleFonts.montserrat(
    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.5);

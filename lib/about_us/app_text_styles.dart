
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{

  static TextStyle home({required Color color,required double fontSize }) {
    return GoogleFonts.kanit(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle headerTextStyle({required Color color }) {
    return GoogleFonts.signikaNegative(
      fontSize: 90,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle monteseratStyle(
      {required Color color, required double fontSize }){
    return GoogleFonts.passionOne(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  static TextStyle headingStyles(
      {required Color color, double fontSize = 50}) {
    return GoogleFonts.lemon(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 50,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyle(
      {required Color color , double fontSize = 16}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
      letterSpacing: 1.7,
      height: 1.5,
    );
  }

  static TextStyle comfortaaStyle() {
    return GoogleFonts.comfortaa(
        fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white);
  }

}
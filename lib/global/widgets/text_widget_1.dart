import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget1 extends StatelessWidget {
  const TextWidget1({
    super.key,
    required this.text,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.fontLetterSpacing,
    this.fontWordSpacing,
  });

  final String text;
  final Color? fontColor;
  final double? fontSize, fontLetterSpacing, fontWordSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: fontLetterSpacing,
        wordSpacing: fontWordSpacing,
      ),
    );
  }
}

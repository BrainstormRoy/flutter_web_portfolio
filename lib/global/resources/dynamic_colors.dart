import 'package:flutter/material.dart';

Color headerText(Brightness brightness) {
  return brightness == Brightness.dark ? Colors.black87 : Colors.white70;
}

Color bodyText(Brightness brightness) {
  return brightness == Brightness.dark ? Colors.black87 : Colors.white70;
}
// Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
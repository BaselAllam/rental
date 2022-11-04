import 'package:flutter/material.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';


SnackBar snack(String content, int duration, Color color) {
  return SnackBar(
    backgroundColor: color,
    duration: Duration(seconds: duration),
    content: Text(content, style: SharedFonts.whiteStyle),
  );
}
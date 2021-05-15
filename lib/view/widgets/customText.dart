import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  CustomText(this.text, {this.fontSize=20, this.fontColor, this.fontWeight,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize,
    color: fontColor,fontWeight: fontWeight,fontStyle: fontStyle),);
  }
}

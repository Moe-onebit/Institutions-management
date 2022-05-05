import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  late final String text;
  late final double? fontSize;
  late final Color? color;
  late final FontWeight? fontWeight ;
  late final String? fontFamily;
   double? letterSpacing;

  CustomFont({required this.text, this.fontSize, this.color, this.fontWeight , this.fontFamily,  this.letterSpacing});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$text', style: TextStyle(fontSize: fontSize, color: color,fontWeight: fontWeight,fontFamily: fontFamily, letterSpacing: letterSpacing)),
    );
  }
}

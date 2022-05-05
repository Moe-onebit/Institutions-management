import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({Key? key,

    required this.width,
    required this.height,
    required this.margin,
    required this.color,
    required this.borderRadius,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.function,
    this.fontFamiy = '',
    this.letterSpacing = 0})
      : super(key: key);

  final double width;
  final double height;
  final EdgeInsets margin;
  final Color color;
  final BorderRadius borderRadius;
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback function;
  final String fontFamiy;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight, fontFamily: fontFamiy, letterSpacing:  letterSpacing),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header(
      {required this.padding,
      required this.crossAxisAlignment,
      required this.head,
      required this.headTextStyle,
      required this.sizedBoxHeight,
      required this.subtitle,
      required this.subtitleTextStyle});

  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;
  final String head;
  final TextStyle headTextStyle;
  final double sizedBoxHeight;
  final String subtitle;
  final TextStyle subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          Center(
            child: Text(
              head,
              style: headTextStyle,
            ),
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Center(
            child: Text(
              subtitle,
              style: subtitleTextStyle,
            ),
          )
        ],
      ),
    );
  }
}

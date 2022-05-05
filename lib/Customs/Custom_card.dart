import 'package:flutter/material.dart';
import 'dart:ui';

import 'Custom_Font.dart';

class Customcard extends StatelessWidget {
  Customcard(
      {
        this.function,
        this.fontFamily='',
      required this.imageCover,
      required this.imageIcon,
      required this.instName,
      required this.subtitle});
  final VoidCallback? function;
  final String imageCover;
  final String imageIcon;
  final String instName;
  final String subtitle;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: new EdgeInsets.fromLTRB(0.5,9,0.5,9),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.11111,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: const Offset(
                  0.5,
                  0.5,
                ),
                blurRadius: 4.0,
                spreadRadius: 0.1,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          // color: Colors.white.withOpacity(0.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white.withOpacity(0.0),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(imageCover,
                      height: 140, fit: BoxFit.fill ),
                ),
                ListTile(
                  leading: Tab(
                    icon: Image.asset(imageIcon),
                  ),
                  title: Center(
                    child: FittedBox(
                      child: CustomFont(text: instName,
                          fontSize: MediaQuery.of(context).size.width * 0.1, color: Colors.black,fontFamily: fontFamily,fontWeight: FontWeight.w400),
                    ),
                  ),
                  subtitle: Center(child: CustomFont(text: subtitle, fontSize: 18.0, color: Colors.black,fontFamily: fontFamily, fontWeight: FontWeight.normal,)),
                  trailing: Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.more_horiz_rounded),
                      iconSize: 35,
                      color: Colors.black,
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
        // ),
        // ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';


class CustomSubcard extends StatelessWidget {
  CustomSubcard(
      {required this.imageCover,
      required this.imageIcon,
      required this.instName,
      this.function});

  final String imageCover;
  final String imageIcon;
  final String instName;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: new EdgeInsets.fromLTRB(0.5, 9, 0.5, 9),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(imageCover, height: 140, fit: BoxFit.fill),
                ),
                ListTile(
                  leading: Tab(
                    icon: Image.asset(imageIcon),
                  ),
                  title: Center(
                    child: FittedBox(
                      child: AutoSizeText(instName,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            color: Colors.black,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 4,
                          )),
                    ),
                  ),
                  trailing: Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.more_horiz_rounded),
                      iconSize: 35,
                      color: Colors.black,
                      onPressed:null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:demo_app/Customs/Custom_card.dart';
import 'package:demo_app/Pages/InstitutionPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Customs/Custom_sub_card.dart';

class Institutions extends StatefulWidget {
  @override
  _InstutotionState createState() => _InstutotionState();
}

class _InstutotionState extends State<Institutions> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.teal,
      onRefresh: () => _refresh(),
      child: Container(
        color: Colors.grey.shade50,
        child: Flex(
          direction: Axis.vertical,
          children: [ Flexible(
            fit: FlexFit.loose,
            child: ListView(children: [
              CustomSubcard(
                function: () => Get.to(()=> InstitutionPage()),
                imageCover: 'images/inst.png',
                instName: 'Auspicium aevi',
                imageIcon: 'images/icon.png',
              ),
            ], padding: EdgeInsets.all(10)),
          ),]
        ),
      ),
    );
  }
}

Future<void> _refresh() async {
  return Future.delayed(Duration(seconds: 8));
}

import 'package:demo_app/Customs/Custom_sub_card.dart';
import 'package:demo_app/Pages/SubjectPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subjects extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.teal,
      onRefresh: () => _refresh(),
      child: Container(
        color: Colors.grey.shade50,
        child: Flex(
          direction: Axis.vertical,
          children:[ Flexible(
            fit: FlexFit.loose,
            child: ListView(
              children: [
                CustomSubcard(
                    function: ()=> Get.to(()=> SubjectPage()),
                    imageCover: 'images/physicsbanner.png',
                    imageIcon: 'images/atom.png',
                    instName: 'Physics'),
                CustomSubcard(
                    imageCover: 'images/mathbanner.png',
                    imageIcon: 'images/calculating.png',
                    instName: 'Math'),
                CustomSubcard(
                    imageCover: 'images/code.png',
                    imageIcon: 'images/binary-code.png',
                    instName: 'Programming'),
                CustomSubcard(
                    imageCover: 'images/networkbanner.png',
                    imageIcon: 'images/network.png',
                    instName: 'Networks'),
              ],
              padding: EdgeInsets.all(10),
            ),
          ),]
        ),
      ),
    );
  }
}

Future<void> _refresh() async {
  return Future.delayed(Duration(seconds: 8));
}

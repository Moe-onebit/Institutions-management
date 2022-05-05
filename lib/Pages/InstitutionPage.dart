import 'dart:ui';
import 'package:demo_app/core/view_model/map_utils.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '/Customs/Custom_sub_card.dart';
import 'SubjectPage.dart';

class InstitutionPage extends StatefulWidget {
  @override
  _InstitutionPageState createState() => _InstitutionPageState();
}

class _InstitutionPageState extends State<InstitutionPage> {
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.teal,
      onRefresh: () => _refresh(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(slivers: [
            _buildTopContent(),
            SliverList(
                delegate: SliverChildListDelegate([
              //To build the content of the page
              _buildContent(),
            ]))
          ]),
        ),
      ),
    );
  }

  //Topping class
  _buildTopContent() => SliverAppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              //Page cover
              Image.asset(
                'images/physicsbanner.png',
              ).blurred(
                  alignment: Alignment.bottomCenter,
                  colorOpacity: 0,
                  blur: 2.5,
                  blurColor: Colors.transparent),
              //Subject name
              Positioned(
                bottom: 25,
                left: 10,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Institution name',
                        style: TextStyle(
                            letterSpacing: 2.15,
                            fontFamily: 'Cabin',
                            color: Colors.black87,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      _build_Rating()
                    ]),
              ),
            ],
          ),
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.200,
      );

  //Build the remaining content of the page
  _buildContent() => Column(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExpandableText(
                    'Opens at 10:00 am',
                    style: TextStyle(
                        fontFamily: 'Cabin',
                        color: Colors.grey.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.w100),
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 1,
                    linkColor: Colors.lightBlueAccent,
                  ),
                  GestureDetector(
                    onTap:()=> MapUtils.openMap(40.730610, -73.935242),
                    child: Text(
                      'Open location'
                    ),
                  ),
                Divider(),
                Container(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      CustomSubcard(
                          function: () => Get.to(SubjectPage()),
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
                  ),
                )
              ],
            ),
          ),
        ],
      );

  //Rating class
  _build_Rating() => RatingBar.builder(
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 25,
        glowColor: Colors.transparent,
        updateOnDrag: true,
        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
        onRatingUpdate: (rating) {
          setState(() {
            _rating = rating;
          });
        },
        itemBuilder: (BuildContext context, int index) => Icon(
          Icons.star_rate_rounded,
          color: Colors.amber,
        ),
      );

//showRating() => showDialog(context: context,
//  builder: (context) => AlertDialog(
//  title: Text('Rate this course'),
//content: Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisSize: MainAxisSize.min,
//children: [
//Text(
//'Please leave a star rating.',
//style: TextStyle(fontSize: 20),
//),
//build_Rating()
//],
//),

//actions: [
//TextButton(onPressed: () => Navigator.pop(context), child: Text('OK', style: TextStyle(fontSize: 20),))
//],
//));
}

//Page refresher class
Future<void> _refresh() async {
  return Future.delayed(Duration(seconds: 8));
}

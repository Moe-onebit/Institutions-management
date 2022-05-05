import 'dart:ui';
import 'package:demo_app/Customs/Custom_Raised_Button.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
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
                        'Physics',
                        style: TextStyle(
                            letterSpacing: 2.15,
                            fontFamily: 'Cabin',
                            color: Colors.black87,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        child: Text(
                          'LA institution',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cabin',
                              fontSize: 15),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.200,
      );

  _buildContent() => Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Flexible(
                      //Course Explanation
                      child: ExpandableText(
                        'Welcome to Physics course here you can learn about physics.',
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
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey.shade500,
                  thickness: 0.4,
                ),
                //Course Information
                _buildCourseInformation('Time:', '15 hours'),
                SizedBox(
                  height: 10,
                ),
                _buildCourseInformation('Course Teacher:', 'Basel Hasan'),
                SizedBox(
                  height: 10,
                ),
                _buildCourseInformation('Price:', '25,000 SP'),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15.0,
                ),
                build_Rating(),
                SizedBox(height: 10,),
                TextButton(
                    onPressed: () => Get.to(showRating()) ,
                    child: Text(
                      'rate',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueAccent),
                    )),
                build_Register_Button()
              ],
            ),
          ),
        ],
      );

  //Course Information class
  _buildCourseInformation(String _word1, String _word2) => Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _word1,
                  style: TextStyle(
                      letterSpacing: 0.6,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.grey.shade500),
                ),
                Text(
                  _word2,
                  style: TextStyle(
                      letterSpacing: 0.6,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      );

  //Register button class
  build_Register_Button() => CustomRaisedButton(
        width: 200,
        height: 50,
        margin: EdgeInsets.all(2),
        color: Colors.teal.shade600,
        borderRadius: BorderRadius.circular(5),
        text: 'Enroll',
        textColor: Colors.grey.shade100,
        fontSize: 21.5,
        fontWeight: FontWeight.w500,
        fontFamiy: 'Cabin',
        letterSpacing: 0.75,
        function: showEnrollment,
      );

  //Rating class
  build_Rating() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar.builder(
            ignoreGestures: true,
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 35,
            glowColor: Colors.transparent,
            updateOnDrag: true,
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
            itemBuilder: (BuildContext context, int index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '$_rating',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
          ),
        ],
      );

  show_Build_Rating() =>
      RatingBar.builder(
        initialRating: _rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 35,
        glowColor: Colors.transparent,
        updateOnDrag: true,
        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
        onRatingUpdate: (rating) {
          setState(() {
            _rating = rating;
          });
        },
        itemBuilder: (BuildContext context, int index) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
      );


  showRating() =>  showDialog(
    barrierDismissible: false,
    builder:(SubjectPage) => AlertDialog(
         title: Text('Rate this course'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Please leave a star rating.',
                style: TextStyle(fontSize: 20),
              ),
              show_Build_Rating()
            ],
          ),

          actions: [
            TextButton(onPressed: () => Get.back(), child: Text('OK', style: TextStyle(fontSize: 20),))
          ],
        ), context: context,
  );

  showEnrollment() =>  showDialog(
    barrierDismissible: false,
    builder:(SubjectPage) => AlertDialog(
      title: Text('Are you sure you want to enroll in this course?'),
      actions: [
        TextButton(onPressed: () => Get.back(), child: CustomRaisedButton(
          width: MediaQuery.of(context).size.width ,
          height: 50,
          margin: EdgeInsets.all(2),
          color: Colors.teal.shade600,
          borderRadius: BorderRadius.circular(5),
          text: 'Enroll',
          textColor: Colors.grey.shade100,
          fontSize: 21.5,
          fontWeight: FontWeight.w500,
          fontFamiy: 'Cabin',
          letterSpacing: 0.75,
          function: () => Get.back(),
        ),)
      ],
    ), context: context,
  );
}

//Page refresher class
Future<void> _refresh() async {
  return Future.delayed(Duration(seconds: 4));
}

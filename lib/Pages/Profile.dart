import 'package:demo_app/Pages/SettingForm/PayingForm.dart';
import 'package:flutter/material.dart';

import 'SettingForm/SettingsForm.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _showSettingsPanel() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm(),
          );
        });
  }

  void _showPaymentPanel() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: PayingForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.teal,
      onRefresh: () => _refresh(),
      child: Scaffold(
          body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      )),
    );
  }

  Widget buildTop() => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 55), child: buildCoverImage()),
          Positioned(
            top: 105,
            child: buildProfileImage(),
          ),
        ],
      );

  //Cover Image
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset('images/inst.png',
            width: double.infinity, height: 175, fit: BoxFit.fill),
      );

  //Profile Image
  Widget buildProfileImage() => Container(
        child: CircleAvatar(
          radius: 63,
          backgroundColor: Colors.teal.shade500,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey.shade800,
            backgroundImage: AssetImage('images/icon.png'),
          ),
        ),
      );

  buildContent() => Column(
        children: [
          Text(
            'Moe Zoubi',
            style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Cabin'),
          ),
          SizedBox(
            height: 5,
          ),

          //Clickable text
          GestureDetector(
            onTap: _showSettingsPanel,
            child: Text(
              'Edit Profile',
              style: TextStyle(
                  color: Colors.grey[400], fontSize: 18, fontFamily: 'Cabin'),
            ),
          ),

          //Clickable text
          GestureDetector(
            onTap: _showPaymentPanel,
            child: Text(
              'Fill your points',
              style: TextStyle(
                  color: Colors.grey[400], fontSize: 18, fontFamily: 'Cabin'),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //The divider line
          Divider(
            color: Colors.grey.shade500,
            thickness: 0.1,
          ),
          SizedBox(
            height: 20,
          ),

          //User information
          _buildInformation('Name:', 'Moe'),
          _buildInformation('Age:', '23'),
          _buildInformation('University:', 'Tishreen University'),
          _buildInformation('College:', 'Information Technology'),
          _buildInformation('Year:', 'Fifth'),
          _buildInformation('Balance:', '50000.0'),

        ],
      );
}
//User Information builder class
_buildInformation(final String _word1, final String _word2) => Container(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _word1,
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              _word2,
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 20)
      ]),
    );

Future<void> _refresh() async {
  return Future.delayed(Duration(seconds: 8));
}


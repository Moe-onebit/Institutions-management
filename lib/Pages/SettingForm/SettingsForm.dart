import 'package:demo_app/Customs/Custom_Font.dart';
import 'package:demo_app/Customs/Custom_Raised_Button.dart';
import 'package:demo_app/Customs/InputField.dart';
import 'package:demo_app/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: CustomFont(text: 'Edit Profile',fontSize: 25,fontWeight: FontWeight.bold, fontFamily: 'Cabin',)),
              InputField(
                labelText: 'Name',
                padding: EdgeInsets.all(10),
                borderSide: BorderSide(color: Colors.grey),
                color: Colors.grey,
                inputBorder: InputBorder.none,
                obscureText: false,
                enableSuggestion: true,
                autoCorrect: true,
                textInputAction: TextInputAction.next,
              ),
              InputField(
                labelText: 'Age',
                padding: EdgeInsets.all(10),
                borderSide: BorderSide(color: Colors.grey),
                color: Colors.grey,
                inputBorder: InputBorder.none,
                obscureText: false,
                enableSuggestion: true,
                autoCorrect: true,
                textInputAction: TextInputAction.next,
              ),
              InputField(
                labelText: 'University',
                padding: EdgeInsets.all(10),
                borderSide: BorderSide(color: Colors.grey),
                color: Colors.grey,
                inputBorder: InputBorder.none,
                obscureText: false,
                enableSuggestion: true,
                autoCorrect: true,
                textInputAction: TextInputAction.next,
              ),
              InputField(
                labelText: 'College',
                padding: EdgeInsets.all(10),
                borderSide: BorderSide(color: Colors.grey),
                color: Colors.grey,
                inputBorder: InputBorder.none,
                obscureText: false,
                enableSuggestion: true,
                autoCorrect: true,
                textInputAction: TextInputAction.next,
              ),
              InputField(
                labelText: 'Year',
                padding: EdgeInsets.all(10),
                borderSide: BorderSide(color: Colors.grey),
                color: Colors.grey,
                inputBorder: InputBorder.none,
                obscureText: false,
                enableSuggestion: true,
                autoCorrect: true,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 40,
              ),
              CustomRaisedButton(
                width: 200 ,
                height: 50.0,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                color: Colors.teal.shade500,
                borderRadius: BorderRadius.circular(10),
                text: "Update",
                textColor: Colors.grey.shade200,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                function: () => Get.offAll(HomePage()),
              )
            ],
          ),
        ),
      )
    );
  }
}

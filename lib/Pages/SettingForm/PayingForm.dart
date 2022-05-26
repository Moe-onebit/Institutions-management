import 'package:demo_app/Customs/Custom_Font.dart';
import 'package:demo_app/Customs/Custom_Raised_Button.dart';
import 'package:demo_app/Customs/InputField.dart';
import 'package:demo_app/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class PayingForm extends StatefulWidget {
  @override
  _PayingFormState createState() => _PayingFormState();
}

class _PayingFormState extends State<PayingForm> {
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
                    child: CustomFont(text: 'Make a payment',fontSize: 25,fontWeight: FontWeight.bold, fontFamily: 'Cabin',)),
                InputField(
                  labelText: 'National Number',
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
                  labelText: 'Amount',
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
                  labelText: 'Phone Number',
                  padding: EdgeInsets.all(10),
                  borderSide: BorderSide(color: Colors.grey),
                  color: Colors.grey,
                  inputBorder: InputBorder.none,
                  obscureText: false,
                  enableSuggestion: true,
                  autoCorrect: true,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomRaisedButton(
                  width: 200 ,
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.teal.shade500,
                  borderRadius: BorderRadius.circular(10),
                  text: "Upload",
                  textColor: Colors.grey.shade200,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  function: _uploadFile
                ),
                SizedBox(
                  height: 20,
                ),
                CustomRaisedButton(
                  width: 200 ,
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.teal.shade500,
                  borderRadius: BorderRadius.circular(10),
                  text: "Confirm",
                  textColor: Colors.grey.shade200,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  function: () => Get.offAll(HomePage()),
                ),
              ],
            ),
          ),
        )
    );
  }

  Future _uploadFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null){
    return;
    }
    final file = result.files.first;
  }

}

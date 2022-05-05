import 'package:demo_app/Pages/HomePage.dart';
import 'package:demo_app/Pages/LoginPage.dart';
import 'package:demo_app/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ControlView extends GetWidget <AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user != null)
          ? HomePage()
          : LoginPage();
    });
  }
}

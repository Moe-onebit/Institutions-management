import 'package:demo_app/Pages/InstitutionPage.dart';
import 'package:demo_app/core/view_model/control_view.dart';
import 'package:demo_app/helper/binding.dart';
import 'Pages//HomePage.dart';
import 'package:flutter/material.dart';
import 'Pages//LoginPage.dart';
import 'Pages//RegisterPage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: ControlView(),
    );
  }
}

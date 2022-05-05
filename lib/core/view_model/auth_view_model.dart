import 'package:demo_app/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel extends GetxController {
  late String email, password, name;
  FirebaseAuth _auth = FirebaseAuth.instance;

  late Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Login Account', 'Incorrect Information',colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountInWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Creating an Account', 'Incorrect Information',colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}

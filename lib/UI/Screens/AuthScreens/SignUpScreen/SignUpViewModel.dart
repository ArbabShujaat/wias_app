import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wias/Model/UserModel.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/OTPScreen.dart';
import 'package:wias/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class SignUpViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String picUrl="";
  final _random = Random();
  int? _randomPin;

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  void disposesignupControllers() {
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
  }

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }


    Future<void> _generateRandomPin() async{
    // Generate a random 4-digit PIN
    _randomPin = _random.nextInt(9000) + 1000;

    // Check if the generated PIN exists in Firestore
    await _checkPinExistence(_randomPin!);
  }


  Future<void>  _checkPinExistence(int pin) async {
    final pinSnapshot = await FirebaseFirestore.instance.collection('users').where("pin",isEqualTo:pin.toString()).get();
    if (pinSnapshot.docs.length>0) {
      _generateRandomPin();
    } else {
    }
  }


  Future<String> saveRegisteredUser() async {
    // changeLoadingState();
await _generateRandomPin();
    UserModel userData = UserModel(
        uid: "",
        email: emailController.text,
        phone: phoneController.text,
        ownerpin: _randomPin,
        createdAt: DateTime.now(),
        password: passwordController.text,
        subscription: "",
        picUrl: picUrl,
        username: userNameController.text);
    String status = await FirebaseDBService().registerUser(userData);
    // changeLoadingState();
    if (status == "Sucess") {
      return status;
    }
    return status;
  }

  

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;

  Future<void> verifyPhoneNumber(String phoneNumber, bool resend) async {
    if (resend != true) changeLoadingState();
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatic verification if the code is detected automatically
        if (resend != true) changeLoadingState();
        await _auth.signInWithCredential(credential);
        Get.offAll(() => HomeScreen());
        Fluttertoast.showToast(msg: 'Phone number verified!');
      },
      verificationFailed: (FirebaseAuthException e) {
        if (resend != true) changeLoadingState();

        Fluttertoast.showToast(msg: 'Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        if (resend != true)
          Get.to(() => OTPScreen(
                phoneNumber: phoneNumber,
              ));
        if (resend != true) changeLoadingState();
        Fluttertoast.showToast(msg: 'Verification Code Sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (resend != true) changeLoadingState();
        _verificationId = verificationId;
      },
      timeout: Duration(seconds: 60),
    );
  }

  Future<void> submitSmsCode(String smsCode) async {
    changeLoadingState();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      changeLoadingState();
      String status = await saveRegisteredUser();
      if (status == "Sucess")
        Get.offAll(() => SubscriptionScreen());
      else
        Fluttertoast.showToast(msg: 'Sign up failed: ${status}');

      // Authentication successful
    } catch (e) {
      changeLoadingState();
      Fluttertoast.showToast(msg: 'Verification failed: ${e}');
      print('Error verifying SMS code: $e');
      // Handle error
    }
  }

  void resendSmsCode(String phoneNumber) {
    verifyPhoneNumber(phoneNumber, true);
  }
}

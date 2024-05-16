import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class ProfileViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void disposeLoginControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }



  

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}

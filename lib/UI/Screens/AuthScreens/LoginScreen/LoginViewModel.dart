import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class LogInViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void disposeLoginControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<String> loginUser() async {
    changeLoadingState();

    String status = await FirebaseDBService()
        .loginUser(emailController.text, passwordController.text);
    changeLoadingState();
    if (status == "Sucess") {
      if (userData!.subscription == "")
        Get.offAll(
          SubscriptionScreen(),
        );
      else
        Get.offAll(
          MainBottomNavigationScreen(),
        );

      return status;
    }
    return status;
  }

  

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}

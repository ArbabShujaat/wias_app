import 'package:flutter/material.dart';
import 'package:wias/services/firebase/firebase_services.dart';



class ForgetPasswordViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void disposezForgetPasswordControllers() {
    emailController = TextEditingController();
  }

  Future<String> sendForgetPasswordLink() async {
    changeLoadingState();

    String status = await FirebaseDBService().forgetPassword(
      emailController.text,
    );
    changeLoadingState();
    if (status == "Sucess") {
      return status;
      
    }
    return status;
  }

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
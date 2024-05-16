import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class CreateNewMessageViewMoedl extends ChangeNotifier {
  var messageController = TextEditingController();
  bool _isLoading = false;
  List user = [];
  bool get isLoading => _isLoading;

  void disposeControllers() {
    messageController = TextEditingController();
  }

  Future<void> addNewMessage() async {
    changeLoadingState();

    await FirebaseDBService().addNewMessage(
      user,
      messageController.text,
    );
    Get.offAll(() => MainBottomNavigationScreen());
    changeLoadingState();
  }

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}

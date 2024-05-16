import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> setOnBoardingShownTrue(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingshown', true);


  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class SubscriptionViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> updateSubscription(String subscriptionType) async {
    changeLoadingState();

    await FirebaseDBService().updateSubscription(subscriptionType);
    changeLoadingState();
  }
}

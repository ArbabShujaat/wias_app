import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class SplashViewModel extends ChangeNotifier {
  Future<bool> checkOnboardingShown() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? onBoardingShown = prefs.getBool('onboardingshown')?? false;
    return onBoardingShown!;

    
  }

   Future<void> isUserLoggedIn() async {
    bool check = await FirebaseDBService().checkUserIsLoggedIn();
    print("hooooo");

    if (check) {
          print("hooooo22");
      await FirebaseDBService().getUser().then((value) => {
            if (userData!.subscription == "")
              {
                Get.offAll(
                  const SubscriptionScreen(),
                )
              }
            else
              {
                Get.offAll(
                  // MessageChatScreen(),
                  MainBottomNavigationScreen(),
                )
              }
          });
    } else {
   
        Get.offAll(
          const LoginScreen(),
        );
     
    }
  }
}

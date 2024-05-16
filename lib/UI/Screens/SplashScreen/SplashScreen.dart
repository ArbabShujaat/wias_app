import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:wias/UI/Screens/OnBoardingScreen/MainOnboardingScreen.dart';
import 'package:wias/UI/Screens/SplashScreen/SplashScreenViewModel.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> init() async {
    var splashscreenProvider =
        Provider.of<SplashViewModel>(context, listen: false);

    bool check = await splashscreenProvider.checkOnboardingShown();

    if (check) {
      Timer(
        Duration(seconds: 1),
        () {
          SplashViewModel().isUserLoggedIn();
        },
      );
    } else {
      Timer(
        Duration(seconds: 2),
        () => Get.to(() => MainOnboardingScreen()),
      );
    }
  }

  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalAuthBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 90.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Just for alignement
                NutsActivityIndicator(
                  animating: false,
                  tickCount: 12,
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  endRatio: 0.6,
                  radius: 26.r,
                  startRatio: 1,
                ),
                // ^^Just for alignement^^
                Image.asset(
                  appLogo,
                  width: 221.w,
                  height: 260.h,
                ),
                NutsActivityIndicator(
                  animating: true,
                  tickCount: 12,
                  activeColor: primaryPurpleColor,
                  inactiveColor: Colors.transparent,
                  endRatio: 0.6,
                  radius: 26.r,
                  startRatio: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

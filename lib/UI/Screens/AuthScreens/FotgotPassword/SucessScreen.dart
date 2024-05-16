import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginScreen.dart';

class ForgetSuccess extends StatefulWidget {
  const ForgetSuccess({super.key});

  @override
  State<ForgetSuccess> createState() => _ForgetSuccessState();
}

class _ForgetSuccessState extends State<ForgetSuccess> {
  bool? platform;
  @override
  void initState() {
    platform = Platform.isAndroid;

    super.initState();
  }

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 1.sh,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(background), // Replace with your image asset path
          //   fit: BoxFit.cover,
          // ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Padding(
              padding: EdgeInsets.only(top: 120.sp),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/donegif.gif",
                      width: 240.w,
                      height: 240.h,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  poppinsText(
                    text:
                        "Reset password link has been send to your email please login to your email",
                    textAlign: TextAlign.center,
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 70.h),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(LoginScreen());
                      // Get.to(const SignInScreen());
                    },
                    child: CustomButtonWithCenterTitleWidget(title: 'Back To Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

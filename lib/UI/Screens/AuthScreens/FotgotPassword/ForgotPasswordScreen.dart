import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/CustomTextFieldWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';
import 'package:wias/UI/Screens/AuthScreens/FotgotPassword/ForgotPasswordViewModel.dart';
import 'package:wias/UI/Screens/AuthScreens/FotgotPassword/SucessScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionScreen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final forgetPasswordProvider =
        Provider.of<ForgetPasswordViewModel>(context, listen: false);
    forgetPasswordProvider.disposezForgetPasswordControllers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final forgetPasswordProvider =
        Provider.of<ForgetPasswordViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GlobalAuthBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 100.h),
                      Image.asset(
                        OTPScreenImage,
                        width: 332.w,
                        height: 250.h,
                      ),
                      SizedBox(height: 25.h),
                      poppinsText(
                        text: 'Forget Password',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 18.h),
                      poppinsText(
                        textAlign: TextAlign.center,
                        text:
                            'No worries! Enter your email address below and we will send you a link to reset password.',
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFieldWithTitleWidget(
                        controller: forgetPasswordProvider.emailController,
                        hintText: 'yourname@gmail.com',
                        validator: (value) {
                          if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value.toString()) ==
                              false) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        leadingIcon: emailIcon,
                        title: 'Email Address',
                      ),
                      SizedBox(height: 50.h),
                      GestureDetector(
                       onTap: forgetPasswordProvider.isLoading
                          ? () {}
                          : () {
                              _sendCode(forgetPasswordProvider);
              
                              // Get.to(const ForgetSuccess());
                            },
                      child: forgetPasswordProvider.isLoading
                          ? const CircularProgressIndicator(): CustomButtonWithCenterTitleWidget(
                            title: 'Continue'),
                      ),
                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
    Future<void> _sendCode(ForgetPasswordViewModel forgetpasswordProvider) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await forgetpasswordProvider.sendForgetPasswordLink().then((value) {
        if (value != "Sucess") {
          Fluttertoast.showToast(
            msg: value,
            // toastLength: Toast
            //     .LENGTH_SHORT, // or Toast.LENGTH_LONG
            gravity: ToastGravity.BOTTOM, // Top, Center, Bottom
            timeInSecForIosWeb: 1, // Time duration for iOS and web
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Get.to(const ForgetSuccess());
        }
      });
    }
  }
}

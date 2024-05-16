import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/CustomTextFieldWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/PhoneNumberScreen.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/SignUpViewModel.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final registerProvider =
        Provider.of<SignUpViewModel>(context, listen: false);
    registerProvider.disposesignupControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<SignUpViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GlobalAuthBackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    Image.asset(
                      appLogo,
                      width: 150.w,
                      height: 190.h,
                    ),
                    SizedBox(height: 15.h),
                    poppinsText(
                      text: 'Let’s fill in your details',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 18.h),
                    poppinsText(
                      textAlign: TextAlign.center,
                      text:
                          'Get access to our helpful guides, podcasts and videos '
                          'and start taking control of your life today',
                      fontSize: 14.sp,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFieldWithTitleWidget(
                      title: 'Email Adress',
                      hintText: 'yourname@gmail.com',
                      validator: (value) {
                        if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value.toString()) ==
                            false) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      controller: registerProvider.emailController,
                      leadingIcon: emailIcon,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFieldWithTitleWidget(
                      title: 'Your Name',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                      hintText: '@yourname',
                      controller: registerProvider.userNameController,
                      leadingIcon: personIcon,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFieldWithTitleWidget(
                      title: 'Password',
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.trim().length < 8) {
                          return 'Password must contain 8 characters';
                        }

                        return null;
                      },
                      controller: registerProvider.passwordController,
                      leadingIcon: keyIcon,
                      canObsecureText: true,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFieldWithTitleWidget(
                      title: 'Confirm Password',
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value == null ||
                            value.trim().length < 8 ||
                            registerProvider.passwordController.text !=
                                registerProvider
                                    .confirmPasswordController.text) {
                          return 'Password must contain 8 characters';
                        }

                        return null;
                      },
                      controller: registerProvider.confirmPasswordController,
                      leadingIcon: keyIcon,
                      canObsecureText: true,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(height: 25.h),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          Get.to(() => PhoneNumberScreen());
                        }
                      },
                      child:
                          CustomButtonWithCenterTitleWidget(title: 'Sign up'),
                    ),
                    SizedBox(height: 18.h),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        //TODO: Add function here.
                      },
                      child: poppinsText(
                        text: 'or continue with',
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    GestureDetector(
                      onTap: () async {
                        String status =
                        await FirebaseDBService().signInWithGoogle();
                        Fluttertoast.showToast(
                          msg: status,
                          // toastLength: Toast
                          //     .LENGTH_SHORT, // or Toast.LENGTH_LONG
                          gravity: ToastGravity.BOTTOM, // Top, Center, Bottom
                          timeInSecForIosWeb:
                              1, // Time duration for iOS and web
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Image.asset(
                        googleIcon,
                        width: 58.w,
                        height: 58.w,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SafeArea(
                      top: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          poppinsText(text: 'Already have an account? '),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              //TODO: Add function here.
                              Get.offAll(() => LoginScreen());
                            },
                            child: poppinsText(
                              text: 'Log in',
                              color: primaryPurpleColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

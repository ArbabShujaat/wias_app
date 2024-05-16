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
import 'package:wias/UI/Screens/AuthScreens/FotgotPassword/ForgotPasswordScreen.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginViewModel.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/SignUpScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  void initState() {
    final loginProvider = Provider.of<LogInViewModel>(context, listen: false);
    loginProvider.disposeLoginControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LogInViewModel>(
      context,
    );
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
                        appLogo,
                        width: 150.w,
                        height: 190.h,
                      ),
                      SizedBox(height: 25.h),
                      poppinsText(
                        text: 'Welcome Back!',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 18.h),
                      poppinsText(
                        text: 'welcome back we missed you',
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFieldWithTitleWidget(
                        title: 'Email',
                        hintText: 'Email',
                        validator: (value) {
                          if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value.toString()) ==
                              false) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        controller: loginProvider.emailController,
                        leadingIcon: personIcon,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFieldWithTitleWidget(
                        title: 'Password',
                        hintText: 'Password',
                        controller: loginProvider.passwordController,
                        leadingIcon: keyIcon,
                        validator: (value) {
                          if (value == null || value.trim().length < 8) {
                            return 'Password must contain 8 characters';
                          }

                          return null;
                        },
                        canObsecureText: true,
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.to(ForgetPasswordScreen());
                            //TODO: Add function here.
                          },
                          child: poppinsText(
                            text: 'Forgot Password?',
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: loginProvider.isLoading
                            ? () {}
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  await loginProvider.loginUser().then((value) {
                                    if (value != "Sucess") {
                                      value = value.replaceAll(
                                          "[firebase_auth/invalid-credential] ",
                                          "");

                                      Fluttertoast.showToast(
                                        msg: value,
                                        // toastLength: Toast
                                        //     .LENGTH_SHORT, // or Toast.LENGTH_LONG
                                        gravity: ToastGravity
                                            .BOTTOM, // Top, Center, Bottom
                                        timeInSecForIosWeb:
                                            1, // Time duration for iOS and web
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                  });
                                }
                              },
                        child: loginProvider.isLoading
                            ? const CircularProgressIndicator()
                            : CustomButtonWithCenterTitleWidget(
                                title: 'Sign in'),
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
                      SizedBox(height: 20.h),
                      SafeArea(
                        top: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            poppinsText(text: 'Don\'t have an account? '),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                //TODO: Add function here.
                                Get.to(() => SignUpScreen());
                              },
                              child: poppinsText(
                                text: 'Signup',
                                color: primaryPurpleColor,
                              ),
                            )
                          ],
                        ),
                      ),
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
}

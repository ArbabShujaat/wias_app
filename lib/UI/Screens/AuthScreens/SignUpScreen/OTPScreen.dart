import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/SignUpViewModel.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({required this.phoneNumber, super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  String verificationCode2 = "";
  late Timer _resendTimer;
  int _timerCount = 60;
  bool _timerRunning = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer(); // Start the timer when the screen loads
  }

  @override
  void dispose() {
    _resendTimer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  void _startResendTimer() {
    _timerRunning = true;
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerCount > 0) {
          _timerCount--;
        } else {
          _resendTimer.cancel();
          _timerRunning = false;
        }
      });
    });
  }

  void _resendOtp() {
        final registerProvider = Provider.of<SignUpViewModel>(context,listen: false);
 registerProvider.resendSmsCode(widget.phoneNumber);
    _timerCount = 60;
    _startResendTimer();
  }

 

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<SignUpViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GlobalAuthBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 1.sh,
                width: 1.sw,
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
                      text: 'OTP Verification',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 18.h),
                    poppinsText(
                      textAlign: TextAlign.center,
                      text:
                          'Enter the verification code we just sent on your phone number.',
                      fontSize: 14.sp,
                    ),
                    SizedBox(height: 20.h),
                    OtpTextField(
                      numberOfFields: 6,
                      filled: true,
                      fillColor: whiteColor,
                      // fieldHeight: 50.w,
                      // fieldWidth: 40.w,
                      borderColor: primaryPurpleColor,
                      keyboardType: TextInputType.number,
                      enabledBorderColor: Color(0xffBABABA),
                      focusedBorderColor: primaryPurpleColor,
                      showFieldAsBox: true,
                      // textStyle: poppinsTextStyle(
                      //   fontSize: 22.sp,
                      //   color: primaryPurpleColor,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        verificationCode2 = verificationCode;
                        print(verificationCode2);

                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: Text("Verification Code"),
                        //         content: Text('Code entered is $verificationCode'),
                        //       );
                        //     });
                      }, // end onSubmit
                    ),
                    SizedBox(height: 50.h),
                    GestureDetector(
                        onTap: () {
                          if (registerProvider.isLoading != true)
                            registerProvider.submitSmsCode(verificationCode2);
                        },
                        child: Center(
                          child: registerProvider.isLoading
                              ? CircularProgressIndicator()
                              : CustomButtonWithCenterTitleWidget(
                                  title: 'Continue'),
                        )),
                    SizedBox(height: 18.h),

                       TextButton(
              onPressed: _timerRunning ? null : _resendOtp,
              child: _timerRunning
                  ? Text('Resend OTP in $_timerCount seconds')
                  : Text('Resend OTP'),
            ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     poppinsText(text: 'Resend codes in '),
                    //     timerActive
                    //         ? poppinsText(
                    //             text: '$_secondsRemaining',
                    //             color: primaryPurpleColor,
                    //           )
                    //         : GestureDetector(
                    //             behavior: HitTestBehavior.opaque,
                    //             onTap: () {
                    //               // registerProvider.resendSmsCode(widget.phoneNumber);
                    //               //  _timer.cancel();
                    //               startTimer();
                    //             },
                    //             child: poppinsText(
                    //               text: 'Resend',
                    //               color: primaryPurpleColor,
                    //             ),
                    //           ),
                    //   ],
                    // ),
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

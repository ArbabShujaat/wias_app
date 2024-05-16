import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';

class ChangePinDialogueWidget extends StatefulWidget {



  @override
  State<ChangePinDialogueWidget> createState() => _ChangePinDialogueWidgetState();
}

class _ChangePinDialogueWidgetState extends State<ChangePinDialogueWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ), //this right here
      child: Container(
        width: 352.w,
        height: 347.h,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            poppinsText(
              text: 'Change Pin',
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
            ),
            OtpTextField(
              numberOfFields: 4,
              filled: true,
              fillColor: whiteColor,
              fieldHeight: 70.w,
              fieldWidth: 70.w,
              borderColor: primaryPurpleColor,
              keyboardType: TextInputType.number,
              enabledBorderColor: primaryPurpleColor,
              focusedBorderColor: primaryPurpleColor,
              showFieldAsBox: true,
              textStyle: poppinsTextStyle(
                fontSize: 22.sp,
                color: primaryPurpleColor,
                fontWeight: FontWeight.bold,
              ),
                   handleControllers: (controllers) {

                      },
              //runs when every textfield is filled
              // onSubmit: (String verificationCode) {
              //   showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           title: Text("Verification Code"),
              //           content: Text('Code entered is $verificationCode'),
              //         );
              //       });
              // }, // end onSubmit
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CustomButtonWithCenterTitleWidget(
                title: 'Change',
                width: 314.w,
                height: 50.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class RemoveQuestionDialogueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ), //this right here
      child: Container(
        height: 146.h,
        width: 270.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            poppinsText(
              text: 'Remove Question',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff616161),
            ),
            SizedBox(height: 5.h),
            poppinsText(
              textAlign: TextAlign.center,
              text: 'Are you sure you wanna remove this question',
              fontSize: 13.sp,
              color: Color(0xff9E9E9E),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: poppinsText(
                    text: 'No',
                    fontSize: 14.sp,
                    color: Color(0xff9E9E9E),
                  ),
                ),
                SizedBox(width: 50.w),
                TextButton(
                  onPressed: () {
                    //TODO: Add function here.
                    Get.back();
                  },
                  child: poppinsText(
                    text: 'Yes',
                    fontSize: 14.sp,
                    color: primaryPurpleColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

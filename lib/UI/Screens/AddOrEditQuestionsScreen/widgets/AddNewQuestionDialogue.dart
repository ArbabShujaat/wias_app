
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';

class AddNewQuestionDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 352.w,
        height: 462.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: poppinsText(
                text: 'Add New Question',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35.h),
            poppinsText(
              text: 'Question',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 8.h),
            Container(
              width: 314.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.15),
                    spreadRadius: 0.1,
                    blurRadius: 23.r,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                // controller: controller,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  hintStyle: poppinsTextStyle(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            poppinsText(
              text: 'Answer',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 8.h),
            Container(
              width: 314.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.15),
                    spreadRadius: 0.1,
                    blurRadius: 23.r,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                // controller: controller,
                textAlignVertical: TextAlignVertical.center,
                maxLines: 4,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  hintStyle: poppinsTextStyle(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                //TODO: Add function here.
                Get.back();
              },
              child: CustomButtonWithCenterTitleWidget(title: 'Add'),
            )
          ],
        ),
      ),
    );
  }
}

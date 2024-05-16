import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/widgets/PersonSelectionCardWidget.dart';

class AddPersonListDialogueWidget extends StatelessWidget {
  final bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ), //this right here
      child: Container(
        width: 293.w,
        height: 340.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            poppinsText(
              text: 'Add To Trusted Person ',
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PersonSelectionCardWidget(index: index),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                //TODO: Add function here.
                Get.back();
              },
              child: CustomButtonWithCenterTitleWidget(
                title: 'Add',
                width: 163.w,
                height: 38.h,
                borderRadius: 15.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}

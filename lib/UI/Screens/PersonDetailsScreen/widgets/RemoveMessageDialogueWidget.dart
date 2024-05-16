import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailViewModel.dart';

class RemoveMessageDialogueWidget extends StatefulWidget {
  int index;

 RemoveMessageDialogueWidget({required this.index, });
  @override
  State<RemoveMessageDialogueWidget> createState() =>
      _RemoveMessageDialogueWidgetState();
}

class _RemoveMessageDialogueWidgetState
    extends State<RemoveMessageDialogueWidget> {
  @override
  Widget build(BuildContext context) {
        final personDetailsProvider= Provider.of<PersonDetailsModel>(context);
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
              text: 'Remove Message',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff616161),
            ),
            SizedBox(height: 5.h),
            poppinsText(
              textAlign: TextAlign.center,
              text: 'Are you sure you wanna remove this Message',
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
                    personDetailsProvider.deleteMessage(widget.index);
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/Screens/AddOrEditQuestionsScreen/AddTrustedPersonScreen.dart';
import 'package:wias/UI/Screens/AddOrEditQuestionsScreen/widgets/RemoveQuestionDialogueBox.dart';

class QuestionsFieldWithEditOptionWidget extends StatefulWidget {
  final int questionNumber;
  final String question;

  QuestionsFieldWithEditOptionWidget({
    required this.question,
    required this.questionNumber,
  });

  @override
  State<QuestionsFieldWithEditOptionWidget> createState() =>
      _QuestionsFieldWithEditOptionWidgetState();
}

class _QuestionsFieldWithEditOptionWidgetState
    extends State<QuestionsFieldWithEditOptionWidget> {
  bool selectionValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: blackColor.withOpacity(0.1),
          ),
          child: Center(
            child: poppinsText(
              text: widget.questionNumber.toString(),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 360.w,
                  child: poppinsText(text: widget.question),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: Add function here.
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          RemoveQuestionDialogueBox(),
                    );
                  },
                  child: Image.asset(
                    deleteIconRed,
                    width: 20.w,
                    height: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 370.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: blackColor),
                  ),
                  child: TextFormField(
                    cursorHeight: 24.h,
                    maxLines: 6,
                    textAlignVertical: TextAlignVertical.top,
                    style: poppinsTextStyle(fontSize: 12.sp),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      border: InputBorder.none,
                      hintText: 'Write your answer',
                      hintStyle: poppinsTextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10.h,
                  right: 95.w,
                  child: Container(
                    width: 29.w,
                    height: 29.w,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(personImage),
                  ),
                ),
                Positioned(
                  bottom: -10.h,
                  right: 75.w,
                  child: Container(
                    width: 29.w,
                    height: 29.w,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(lollaSmithImage),
                  ),
                ),
                Positioned(
                  bottom: -10.h,
                  right: 55.w,
                  child: Container(
                    width: 29.w,
                    height: 29.w,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(personImage),
                  ),
                ),
                Positioned(
                  bottom: -10.h,
                  right: 35.w,
                  child: Container(
                    width: 29.w,
                    height: 29.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffE4E4E4),
                    ),
                    child: Center(
                      child: poppinsText(
                        text: '+2',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff767676),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10.h,
                  right: 0.w,
                  child: GestureDetector(
                    onTap: () {
                      //TODO: Add function here.
                      Get.to(() => AddTrustedPersonScreen());
                    },
                    child: Image.asset(
                      addIcon,
                      width: 29.w,
                      height: 29.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ],
    );
  }
}

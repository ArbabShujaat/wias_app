import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddNewUserViewModel.dart';

class QuestionsFieldWithSelectionWidget extends StatefulWidget {
  final int questionNumber;
  final String question;
  final AddNewUserModel provider;

  QuestionsFieldWithSelectionWidget({
    required this.question,
    required this.questionNumber,
    required this.provider,
  });

  @override
  State<QuestionsFieldWithSelectionWidget> createState() =>
      _QuestionsFieldWithSelectionWidgetState();
}

class _QuestionsFieldWithSelectionWidgetState
    extends State<QuestionsFieldWithSelectionWidget> {
  bool selectionValue = false;
  @override
  void initState() {
    // TODO: implement initState
    widget.provider.combinedQuestionAnswer.clear();
    super.initState();
  }

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
            child: poppinsText(text: widget.questionNumber.toString()),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            selectionValue = !selectionValue;
            if (selectionValue == true) {
              widget.provider.combinedQuestionAnswer.add({
                "Question": widget.question,
                "Answer": widget
                    .provider.answerControllers[widget.questionNumber - 1].text,
              });
            } else
              widget.provider.combinedQuestionAnswer.removeWhere(
                  (element) => element["Question"] == widget.question);

            log(widget.provider.combinedQuestionAnswer.toString());

            setState(() {});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 360.w,
                    child: poppinsText(text: widget.question),
                  ),
                  Container(
                    width: 17.w,
                    height: 17.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectionValue ? blackColor : Colors.transparent,
                      // Color(0xffBA4F74),
                      border: Border.all(color: blackColor),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 12.sp,
                        color: selectionValue ? whiteColor : Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
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
                  onChanged: (value) {
                    widget.provider.combinedQuestionAnswer.removeWhere(
                        (element) => element["Question"] == widget.question);
                    selectionValue = false;
                    setState(() {});
                  },
                  controller: widget
                      .provider.answerControllers[widget.questionNumber - 1],
                  textAlignVertical: TextAlignVertical.top,
                  style: poppinsTextStyle(fontSize: 12.sp),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    border: InputBorder.none,
                    hintText: 'Write your answer',
                    hintStyle: poppinsTextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff7E7E7E),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ],
    );
  }
}

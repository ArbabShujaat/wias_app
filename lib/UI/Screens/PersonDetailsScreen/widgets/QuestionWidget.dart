import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailViewModel.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RemoveMessageDialogueWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RemoveQuestionDialog.dart';

class QuestionWidget extends StatefulWidget {
  int index;
  DocumentSnapshot snapshot;
PersonDetailsModel provider;
  QuestionWidget({required this.index, required this.provider,required this.snapshot});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  
  @override
  Widget build(BuildContext context) {
       final personDetailsProvider= Provider.of<PersonDetailsModel>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print("This is index 1st"+widget.index.toString());
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      RemoveQuestionDialogueWidget(
                    index: widget.index,
                    snapshot: widget.snapshot,
                    Question: widget.provider.questions![widget.index]["Question"],
                    Answer: widget.provider.questions![widget.index]["Answer"],

                  ),
                );
              },
              child: Image.asset(
                deleteIconRed,
                width: 20.w,
                height: 20.w,
              ),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
        SizedBox(height: 10.h),
        Row(
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
                child: poppinsText(text: (widget.index+1).toString()),
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 320.w,
                  child: poppinsText(
                    text: widget.provider.questions![widget.index]["Question"],
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 320.w,
                  child: poppinsText(
                    text:widget.provider.questions![widget.index]["Answer"],
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            )
          ],
        ),
      ],
    );
  }
}

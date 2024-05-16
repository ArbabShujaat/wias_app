import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailViewModel.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RemoveMessageDialogueWidget.dart';

class MessageBubbleWidget extends StatefulWidget {
  int index;

  MessageBubbleWidget({required this.index, });
  @override
  State<MessageBubbleWidget> createState() => _MessageBubbleWidgetState();
}

class _MessageBubbleWidgetState extends State<MessageBubbleWidget> {
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


                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      RemoveMessageDialogueWidget(
                    index: widget.index,
                    
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
        SizedBox(
          height: 10.h,
        ),
        BubbleSpecialThree(
          text: personDetailsProvider.messages![widget.index],

          textStyle: poppinsTextStyle(
            color: whiteColor,
            fontSize: 16.sp,
          ),
          color: primaryPurpleColor,
          constraints: BoxConstraints(maxWidth: 1.sw,minWidth: 1.sw,minHeight: 40.h),
          tail: true,
          isSender: false,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

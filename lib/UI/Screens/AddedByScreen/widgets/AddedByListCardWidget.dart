import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/CustomTransparentButtonWithCenterTitle.dart';
import 'package:wias/UI/Screens/AddedByScreen/widgets/UnblockPinDialogueWidget.dart';
import 'package:wias/UI/Screens/AdminChatScreen/AdminChatScreen.dart';

class AddedByListCardWidget extends StatelessWidget {
  final bool isLocked;

  const AddedByListCardWidget({
    super.key,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: blackColor, width: 0.5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      personImage,
                      width: 71.w,
                      height: 71.w,
                    ),
                    SizedBox(width: 13.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            poppinsText(
                              text: 'Alexander',
                              fontWeight: FontWeight.bold,
                            ),
                            poppinsText(
                              text: '22-03-2024',
                              fontSize: 11.sp,
                            )
                          ],
                        ),
                        poppinsText(
                          text: 'Your Pin: 1122',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    )
                  ],
                ),
                Visibility(
                  visible: isLocked,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                UnblockPinDialogueWidget(),
                          );
                        },
                        child: CustomTransparentButtonWithCenterTitle(
                          title: 'Unlock',
                          width: 75.w,
                          height: 30.h,
                          titleFontSize: 10.sp,
                          borderRadius: 10.r,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AdminChatScreen());
                        },
                        child: CustomButtonWithCenterTitleWidget(
                          title: 'Request Pin',
                          width: 75.w,
                          height: 30.h,
                          titleFontSize: 10.sp,
                          borderRadius: 10.r,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: isLocked,
            child: Positioned(
              top: -14.h,
              right: -7,
              child: Icon(
                Icons.lock,
                size: 26.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

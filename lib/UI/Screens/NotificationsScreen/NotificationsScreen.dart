import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: 110,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.send),
                      ),
                    ),
                    poppinsText(
                      text: 'Notifications',
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    //ONLY for Alignment
                    Icon(Icons.send, color: Colors.transparent),
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    poppinsText(
                      text: 'Today',
                      fontSize: 14.sp,
                      color: greyColor,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Image.asset(
                          notificationStatusIcon,
                          width: 48.w,
                          height: 48.w,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            poppinsText(
                              text: 'John is now your trusted person',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            poppinsText(
                              text: 'Recently',
                              fontSize: 14.sp,
                              color: greyColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

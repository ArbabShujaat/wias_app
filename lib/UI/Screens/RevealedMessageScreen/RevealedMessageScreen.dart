import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/MessageBubbleWidget.dart';

class RevealedMessageScreen extends StatelessWidget {
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
                      text: 'Added By',
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => NotificationsScreen());
                      },
                      child: Image.asset(
                        notificationIcon,
                        width: 36.w,
                        height: 36.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      personImage,
                      width: 85.w,
                      height: 85.w,
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        poppinsText(
                          text: 'John Doe',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8.h),
                        poppinsText(
                          text: 'Trusted Person',
                          fontSize: 20.sp,
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                    Spacer(),
                    poppinsText(
                      text: 'Pin: 1122',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                SizedBox(height: 34.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    poppinsText(
                      text: 'Message',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 15.h),
                    // MessageBubbleWidget(),
                    SizedBox(height: 20.h),
                    poppinsText(
                      text: 'Questions',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 20.h),
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
                            child: poppinsText(text: '1'),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 320.w,
                              child: poppinsText(
                                text: 'Do you have investments? What type?',
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: 320.w,
                              child: poppinsText(
                                text:
                                    'Lorem Ipsum is dummy text of the printing and typesetting '
                                    'industry, derived from a Latin passage by CiceroLorem Ipsum '
                                    'is dummy text of the printing and typesetting industry, '
                                    'derived from a Latin passage by Cicero',
                                fontSize: 11.sp,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

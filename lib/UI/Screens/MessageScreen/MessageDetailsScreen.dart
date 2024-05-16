import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RemovePersonDialogueBox.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/widgets/AddPersonListDialogueWidget.dart';

class MessageDetailsScreen extends StatelessWidget {
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
                      text: 'Write A Message',
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
                TextField(
                  maxLines: 10,
                  maxLength: 500,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  style: poppinsTextStyle(fontSize: 12.sp),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    hintText: 'Write your message here.......',
                    hintStyle: poppinsTextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff7E7E7E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    poppinsText(
                      text: 'Added Persons',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO: Add function here.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AddPersonListDialogueWidget(),
                        );
                      },
                      child: CustomButtonWithCenterTitleWidget(
                        title: 'Add New',
                        width: 84.w,
                        height: 30.h,
                        borderRadius: 10.r,
                        titleFontSize: 12.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  personImage,
                                  width: 39.w,
                                  height: 39.w,
                                ),
                                SizedBox(width: 20.w),
                                poppinsText(text: 'Alexander')
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: Add function here.
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) =>
                                //       RemovePersonDialogueBox(),
                                // );
                              },
                              child: Icon(
                                Icons.cancel,
                                color: redColor,
                                size: 18.sp,
                              ),
                            )
                          ],
                        ),
                        Divider(thickness: 1.2),
                      ],
                    );
                  },
                ),
                SizedBox(height: 80.h),
                GestureDetector(
                  onTap: () {
                    //TODO: add function here.
                    Get.back();
                  },
                  child: CustomButtonWithCenterTitleWidget(title: 'Update'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class AdminChatScreen extends StatelessWidget {
  const AdminChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                spreadRadius: 0.1,
                blurRadius: 23.r,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              fillColor: Color(0xffF8F9FA),
              filled: true,
              hintText: 'Write a Message',
              hintStyle: poppinsTextStyle(),
              suffixIcon: GestureDetector(
                onTap: () {
                  //TODO: Add function here.
                },
                child: Image.asset(
                  sendMessageIcon,
                  scale: 3.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blackColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(20.r),
              ),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blackColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Transform.rotate(
                    angle: 110,
                    child: GestureDetector(
                      onTap: () {
                        //TODO: add function here.
                        Get.back();
                      },
                      child: Icon(Icons.send),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Image.asset(
                    adminProfileImage,
                    width: 44.w,
                    height: 44.w,
                  ),
                  SizedBox(width: 20.w),
                  poppinsText(
                    text: 'Admin',
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      deathCertificateChatImage,
                      width: 195.w,
                      height: 120.h,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 350.w,
                          minWidth: 60.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Color(0xffC45647).withOpacity(0.44),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: poppinsText(
                          text: 'Here is your pin',
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 350.w,
                          minWidth: 60.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Color(0xffC45647).withOpacity(0.44),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: poppinsText(
                          text: '1124',
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

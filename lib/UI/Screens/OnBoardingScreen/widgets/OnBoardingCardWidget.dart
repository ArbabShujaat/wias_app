import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class OnBoardingCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnBoardingCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Image.asset(
              image,
              width: 350.w,
              height: 350.h,
            ),
            SizedBox(height: 80.h),
            poppinsText(
              text: title,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 15.h),
            poppinsText(
              text: description,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class CustomButtonWithCenterTitleWidget extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? titleFontSize;
  CustomButtonWithCenterTitleWidget({
    required this.title,
    this.width,
    this.height,
    this.borderRadius,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: width ?? 314.w,
      height: height ?? 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
        gradient: LinearGradient(
          colors: [
            primaryPurpleColor,
            redColor,
          ],
        ),
      ),
      child: Center(
        child: poppinsText(
          text: title,
          fontSize: titleFontSize ?? 18.sp,
          fontWeight: FontWeight.w500,
          color: whiteColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class SettingsCardOptionWidget extends StatelessWidget {
  final String leadingIcon;
  final String title;

  const SettingsCardOptionWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              leadingIcon,
              width: 18.w,
              height: 18.w,
            ),
            SizedBox(width: 30.w),
            poppinsText(
              text: title,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Divider(
          color: blackColor.withOpacity(0.2),
        ),
      ],
    );
  }
}

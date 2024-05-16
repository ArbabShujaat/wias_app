import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class PersonCardWidget extends StatelessWidget {
  final String leadingImage;
  final String name;

  PersonCardWidget({
    required this.name,
    required this.leadingImage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: greyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:NetworkImage(leadingImage),
                radius: 30,

              ),


              // Image.network(
              //   leadingImage,
              //   width: 71.w,
              //   height: 71.w,
              // ),
              SizedBox(width: 17.w),
              poppinsText(
                text: name,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode? myFocusNode;
  final double? width;
  final double? height;
  SearchBarWidget({
    required this.searchController,
    this.myFocusNode,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 340.w,
      height: height ?? 50.h,
      child: TextField(
        focusNode: myFocusNode ?? null,
        controller: searchController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search Here',
          alignLabelWithHint: true,
          prefixIcon: Container(
            width: 40.w,
            height: 40.h,
            margin: EdgeInsets.only(right: 5.w, left: 5.w),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.search,
                color: primaryPurpleColor,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: primaryPurpleColor, width: 1.5),
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: primaryPurpleColor),
          ),
        ),
      ),
    );
  }
}

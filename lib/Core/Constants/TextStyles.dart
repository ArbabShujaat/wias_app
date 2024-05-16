import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

Text poppinsText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  TextDecoration? textDecoration,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines,
    style: TextStyle(
      color: color ?? blackColor,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontFamily: 'Poppins',
      decoration: textDecoration ?? TextDecoration.none,
    ),
  );
}

TextStyle poppinsTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? blackColor,
    fontSize: fontSize ?? 14.sp,
    fontFamily: 'Poppins',
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

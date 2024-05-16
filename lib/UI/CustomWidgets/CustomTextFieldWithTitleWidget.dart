// import 'package:addibuddy/Core/Constants/Colors.dart';
// import 'package:addibuddy/Core/Constants/TextStyles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomMessageWidget extends StatelessWidget {
//   final String title;
//   final String hintText;
//   final TextEditingController controller;
//   final double? height;
//   final double? borderRadius;
//   CustomMessageWidget({
//     required this.title,
//     required this.controller,
//     required this.hintText,
//     this.height,
//     this.borderRadius,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         quickSandText(
//           text: title,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//         ),
//         SizedBox(height: 10.h),
//         Container(
//           width: 381.w,
//           height: height ?? 60.h,
//           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//           decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
//             border: Border.all(color: chalkBlueColor),
//             boxShadow: [
//               BoxShadow(
//                 color: blackColor.withOpacity(0.2),
//                 offset: Offset(0, 10),
//                 blurRadius: 10,
//                 spreadRadius: 0.1,
//               ),
//             ],
//           ),
//           child: Align(
//             alignment: Alignment.topLeft,
//             child: quickSandText(
//               text: hintText,
//               fontSize: 19.sp,
//               fontWeight: FontWeight.w600,
//               color: lightGreyColor,
//             ),
//           ),
//           // child: TextField(
//           //   maxLines: 2,
//           //   decoration: InputDecoration(
//           //     contentPadding:
//           //         EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
//           //     border: InputBorder.none,
//           //     hintText: hintText,
//           //     hintStyle: quickSandTextStyle(
//           //       fontSize: 19.sp,
//           //       fontWeight: FontWeight.w600,
//           //       color: lightGreyColor,
//           //     ),
//           //   ),
//           // ),
//         ),
//       ],
//     );
//   }
// }

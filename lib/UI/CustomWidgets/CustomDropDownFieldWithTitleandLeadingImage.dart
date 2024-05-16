// import 'package:addibuddy/Core/Constants/Colors.dart';
// import 'package:addibuddy/Core/Constants/TextStyles.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomDropDownFieldWithTitleandLeadingImage extends StatefulWidget {
//   final String title;
//   final String hintText;
//   final List<Map<String, dynamic>> Items;
//   CustomDropDownFieldWithTitleandLeadingImage({
//     required this.title,
//     required this.hintText,
//     required this.Items,
//   });

//   @override
//   State<CustomDropDownFieldWithTitleandLeadingImage> createState() =>
//       _CustomDropDownField();
// }

// class _CustomDropDownField
//     extends State<CustomDropDownFieldWithTitleandLeadingImage> {
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         quickSandText(
//           text: widget.title,
//           fontSize: 19.sp,
//           fontWeight: FontWeight.w700,
//           color: whiteColor,
//         ),
//         SizedBox(height: 10.h),
//         SizedBox(
//           height: 60.h,
//           width: double.infinity,
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton2(
//               isExpanded: true,
//               hint: quickSandText(
//                 text: widget.hintText,
//                 fontSize: 19.sp,
//                 fontWeight: FontWeight.w600,
//                 color: greyColor,
//               ),
//               items: widget.Items.map<DropdownMenuItem<String>>(
//                   (Map<String, dynamic> country) {
//                 return DropdownMenuItem<String>(
//                   value: country['name'],
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         country['image'],
//                         width: 30.w,
//                         height: 30.h,
//                       ),
//                       SizedBox(width: 10),
//                       Text(country['name']),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               value: selectedValue,
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value;
//                 });
//               },
//               icon: Icon(Icons.keyboard_arrow_down_rounded),
//               iconSize: 35.sp,
//               iconEnabledColor: blackColor,
//               buttonHeight: 60.h,
//               buttonWidth: 381.w,
//               buttonPadding: EdgeInsets.only(left: 14, right: 14),
//               buttonDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14.r),
//                 color: whiteColor,
//               ),
//               buttonElevation: 0,
//               itemHeight: 40,
//               dropdownElevation: 8,
//               scrollbarRadius: Radius.circular(25),
//               scrollbarThickness: 6,
//               scrollbarAlwaysShow: false,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';

class PersonSelectionCardWidget extends StatefulWidget {
  final int index;

  PersonSelectionCardWidget({required this.index});

  @override
  State<PersonSelectionCardWidget> createState() =>
      _PersonSelectionCardWidgetState();
}

class _PersonSelectionCardWidgetState extends State<PersonSelectionCardWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              personImage,
              width: 39.w,
              height: 39.w,
            ),
            SizedBox(width: 15.w),
            poppinsText(text: 'Alexander'),
          ],
        ),
        GestureDetector(
          onTap: () {
            //TODO: Add function here.
            setState(() {});
            isSelected = !isSelected;
          },
          child: Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected ? primaryPurpleColor : blackColor),
                gradient: isSelected
                    ? LinearGradient(
                        colors: [
                          primaryPurpleColor,
                          redColor,
                        ],
                      )
                    : LinearGradient(
                        colors: [Colors.transparent, Colors.transparent],
                      )),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
typedef FormValidator = String? Function(String?);
// ignore: must_be_immutable
class CustomTextFieldWithTitleWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  bool? canObsecureText;
  final String leadingIcon;
  final double? width;
  final String title;
  final FormValidator? validator;

  CustomTextFieldWithTitleWidget({
    required this.controller,
    required this.hintText,
     this.validator,
    required this.leadingIcon,
    required this.title,
    this.canObsecureText,
    this.width,
  });

  @override
  State<CustomTextFieldWithTitleWidget> createState() =>
      _CustomTextFieldWithTitleWidgetState();
}

class _CustomTextFieldWithTitleWidgetState
    extends State<CustomTextFieldWithTitleWidget> {
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 314.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          poppinsText(text: widget.title),
          SizedBox(height: 10.h),
          SizedBox(
            height:widget.validator == null ? 50.h: 80.h,
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              obscureText:
                  widget.canObsecureText != null ? !obsecureText : false,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: poppinsTextStyle(),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Image.asset(
                    widget.leadingIcon,
                    width: 15.w,
                    height: 15.h,
                  ),
                ),
                suffixIcon: widget.canObsecureText != null
                    ? GestureDetector(
                        onTap: () {
                          setState(() {});
                          obsecureText = !obsecureText;
                        },
                        child: Icon(
                          obsecureText
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                        ),
                      )
                    : SizedBox.shrink(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

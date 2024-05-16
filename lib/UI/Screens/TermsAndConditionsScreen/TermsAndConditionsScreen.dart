import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';

// ignore: must_be_immutable
class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: 110,
                          child: GestureDetector(
                            onTap: () {
                              //TODO: add function here.
                              Get.back();
                            },
                            child: Icon(Icons.send),
                          ),
                        ),
                        poppinsText(
                          text: 'Terms & Conditions',
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        //ONLY for Alignment
                        Icon(Icons.send, color: Colors.transparent),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 0.75.sh,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          poppinsText(
                            text:
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by '
                                'Lorem Ipsum is dummy text of the printing and typesetting industry, '
                                'derived from a Latin passage by CiceroLorem Ipsum is dummy text of '
                                'the printing and typesetting industry, derived from a Latin passage by ',
                            fontSize: 16.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

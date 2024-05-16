import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/CustomWidgets/SearchBarWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RemovePersonDialogueBox.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/widgets/PersonSelectionCardWidget.dart';

// ignore: must_be_immutable
class AddTrustedPersonScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: 110,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.send),
                          ),
                        ),
                        poppinsText(
                          text: 'Add To Trusted Person',
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        //ONLY FOR ALIGNMENT
                        Icon(
                          Icons.send,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    SearchBarWidget(
                      searchController: searchController,
                      width: 387.w,
                    ),
                    SizedBox(height: 40.h),
                    Column(
                      children: [
                        poppinsText(
                          text: 'Added Persons',
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          personImage,
                                          width: 39.w,
                                          height: 39.w,
                                        ),
                                        SizedBox(width: 20.w),
                                        poppinsText(text: 'Alexander')
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        //TODO: Add function here.
                                        // showDialog(
                                        //   context: context,
                                        //   builder: (BuildContext context) =>
                                        //       RemovePersonDialogueBox(),
                                        // );
                                      },
                                      child: Icon(
                                        Icons.cancel,
                                        color: redColor,
                                        size: 18.sp,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(thickness: 1.2),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        poppinsText(
                          text: 'Add New Person',
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                PersonSelectionCardWidget(index: index),
                                Divider(),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        //TODO: Add function here.
                        Get.back();
                      },
                      child: CustomButtonWithCenterTitleWidget(title: 'Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

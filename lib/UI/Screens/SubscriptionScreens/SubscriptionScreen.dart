import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomTransparentButtonWithCenterTitle.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';

import 'package:wias/UI/Screens/QuestionsScreens/StartQuestionsScreens.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/FreeTrialScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/LimitedAccessScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionViewModel.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GlobalAuthBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    premiumImage,
                    width: 270.w,
                    height: 270.w,
                  ),
                  // SizedBox(height: 25.h),
                  poppinsText(
                    text: 'Only \$1.99 per month',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 10.h),
                  poppinsText(
                    text: 'Upgrade To Premium',
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 18.h),
                  poppinsText(
                    textAlign: TextAlign.center,
                    text: 'Why become a premium member? You can all '
                        'features and get bonus from you '
                        'vocation',
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_box_outlined, size: 22.sp),
                          SizedBox(width: 5.w),
                          poppinsText(
                            text: 'Add 20 Special People',
                            fontSize: 16.sp,
                            color: Color(0xff585858),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(Icons.check_box_outlined, size: 22.sp),
                          SizedBox(width: 5.w),
                          poppinsText(
                            text: 'Upto 3 Trusted Contacts',
                            fontSize: 16.sp,
                            color: Color(0xff585858),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(Icons.check_box_outlined, size: 22.sp),
                          SizedBox(width: 5.w),
                          poppinsText(
                            text: 'No Ads',
                            fontSize: 16.sp,
                            color: Color(0xff585858),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(Icons.check_box_outlined, size: 22.sp),
                          SizedBox(width: 5.w),
                          poppinsText(
                            text: 'Longer Messages',
                            fontSize: 16.sp,
                            color: Color(0xff585858),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60.h),
                  GestureDetector(
                    onTap: () {
                      subscriptionProvider
                          .updateSubscription("Premium Acess")
                          .then((value) {
                        Get.offAll(() => QuestionsScreens());
                      });
                    },
                    child: Container(
                      width: 314.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                          colors: [
                            primaryPurpleColor,
                            redColor,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            premiumCrownIcon,
                            width: 28.w,
                            height: 28.w,
                          ),
                          poppinsText(
                            text: 'Upgrade Now For Premium Access',
                            fontSize: 15.sp,
                            // fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () {
                      //TODO: Add function here
                      Get.to(() => LimitedAccessScreen());
                    },
                    child: CustomTransparentButtonWithCenterTitle(
                      title: 'Limited Access',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => FreeTrialScreen());
                    },
                    child: CustomTransparentButtonWithCenterTitle(
                      title: 'Free Trial',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

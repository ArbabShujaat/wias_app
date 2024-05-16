import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';
import 'package:wias/UI/Screens/QuestionsScreens/StartQuestionsScreens.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionViewModel.dart';

class FreeTrialScreen extends StatelessWidget {
  const FreeTrialScreen({super.key});

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
                  SizedBox(height: 100.h),
                  Image.asset(
                    freeTrialImage,
                    width: 270.w,
                    height: 270.w,
                  ),
                  SizedBox(height: 30.h),
                  poppinsText(
                    text: 'Free Trial',
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Icon(
                              Icons.circle,
                              size: 6.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 350.w,
                            child: poppinsText(
                              text:
                                  'Get a free one week trial to try the app with full access.',
                              fontSize: 16.sp,
                              color: Color(0xff585858),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Icon(
                              Icons.circle,
                              size: 6.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 350.w,
                            child: poppinsText(
                              text: 'Ads will be included.',
                              fontSize: 16.sp,
                              color: Color(0xff585858),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Icon(
                              Icons.circle,
                              size: 6.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 350.w,
                            child: poppinsText(
                              text:
                                  'It will only simulate sending a PIN number to a '
                                  '“Trusted Person”, not actually send it ',
                              fontSize: 16.sp,
                              color: Color(0xff585858),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  GestureDetector(
                    onTap: () {
                      subscriptionProvider
                          .updateSubscription("Limited Access")
                          .then((value) {
                        Get.offAll(() => QuestionsScreens());
                      });
                    },
                    child: subscriptionProvider.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButtonWithCenterTitleWidget(title: 'Continue'),
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

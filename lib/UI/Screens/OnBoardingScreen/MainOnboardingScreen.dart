import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAuthBackgroundWidget.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:wias/UI/Screens/OnBoardingScreen/OnBordindViewModel.dart';
import 'package:wias/UI/Screens/OnBoardingScreen/widgets/OnBoardingCardWidget.dart';

class MainOnboardingScreen extends StatefulWidget {
  @override
  State<MainOnboardingScreen> createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = Provider.of<OnBoardingViewModel>(context);
    return Scaffold(
      body: GlobalAuthBackgroundWidget(
        child: IntroductionScreen(
          key: introKey,
          controlsPosition: Position(bottom: 90.h, left: 0, right: 0),
          rawPages: [
            OnBoardingCardWidget(
              image: onBoardingImage1,
              title: 'Add 20 Special People',
              description: 'Create a lasting legacy by adding 20 special '
                  'individuals and leaving them personalized messages '
                  'to treasure forever.',
            ),
            OnBoardingCardWidget(
              image: onBoardingImage2,
              title: 'No Ads',
              description: 'Enjoy an ad-free experience. No interruptions,'
                  ' just pure content from the get-go.',
            ),
            OnBoardingCardWidget(
              image: onBoardingImage1,
              title: 'Longer Messages',
              description: 'Lorem Ipsum is dummy text of the printing and '
                  'typesetting industry, derived from a Latin '
                  'passage by Cicero',
            ),
          ],
          showNextButton: false,
          showDoneButton: false,
          showBackButton: false,
          globalFooter: Column(
            children: [
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  if (introKey.currentState?.getCurrentPage() == 2) {
                    onBoardingProvider.setOnBoardingShownTrue(context);
                  }

                  introKey.currentState?.getCurrentPage() == 2
                      ? Get.to(() => LoginScreen())
                      : introKey.currentState?.next();
                },
                child: CustomButtonWithCenterTitleWidget(title: 'Next'),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  onBoardingProvider.setOnBoardingShownTrue(context);
                  Get.to(() => LoginScreen());
                },
                child: poppinsText(
                  text: 'Skip',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          dotsFlex: 0,
          dotsDecorator: const DotsDecorator(
            shape: StadiumBorder(),
            size: Size(30, 3),
            color: Color(0xFFBDBDBD),
            activeSize: Size(30, 3),
            activeShape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}

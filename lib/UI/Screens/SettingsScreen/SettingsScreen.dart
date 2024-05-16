import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/AdminChatScreen/AdminChatScreen.dart';
import 'package:wias/UI/Screens/MySubscription/MySubscription.dart';
import 'package:wias/UI/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:wias/UI/Screens/SettingsScreen/widgets/LogoutSheetWidget.dart';
import 'package:wias/UI/Screens/SettingsScreen/widgets/SettingsCardOptionWidget.dart';
import 'package:wias/UI/Screens/TermsAndConditionsScreen/TermsAndConditionsScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalAppBackgroundWidget(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  poppinsText(
                    text: 'Settings',
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 26.h),
                  
                  if(  userData!.picUrl != "")
                  CircleAvatar(
      radius: 40, // Adjust the size of the circle as needed
      backgroundImage: NetworkImage(  userData!.picUrl!),
      backgroundColor: Colors.transparent
      , // Fallback color if the image fails to load
    ),


                     if(  userData!.picUrl == "")
                                  CircleAvatar(
      radius: 40, // Adjust the size of the circle as needed
      child: Icon(Icons.person_add_alt_1,color: const Color.fromARGB(206, 158, 158, 158),size: 60,),
      backgroundColor: Colors.white, // Fallback color if the image fails to load
    ),

                  SizedBox(height: 16.h),
                  poppinsText(
                    text: userData!.username!,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 38.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      //TODO: Add function here.
                      Get.to(() => ProfileScreen());
                    },
                    child: SettingsCardOptionWidget(
                      leadingIcon: personIcon,
                      title: 'Profile',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {

Share.share('Check out WIAS App : https://google.com');
                    },
                    child: SettingsCardOptionWidget(
                      leadingIcon: shareIcon,
                      title: 'Share app',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      //TODO: Add function here.
                      Get.to(() => MySubscriptionScreen());
                    },
                    child: SettingsCardOptionWidget(
                      leadingIcon: crownIcon,
                      title: 'My Subscription',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      //TODO: Add function here.
                      Get.to(() => AdminChatScreen());
                    },
                    child: SettingsCardOptionWidget(
                      leadingIcon: chatIcon,
                      title: 'Chat With Admin',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      //TODO: Add function here.
                      Get.to(() => TermsAndConditionsScreen());
                    },
                    child: SettingsCardOptionWidget(
                      leadingIcon: termsIcon,
                      title: 'Terms & Conditions',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      //TODO: Add function here.
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return LogoutSheetWidget();
                        },
                      );
                    },
                    child: SettingsCardOptionWidget(
                      leadingIcon: logoutIcon,
                      title: 'Logout',
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

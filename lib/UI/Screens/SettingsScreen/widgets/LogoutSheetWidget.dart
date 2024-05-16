import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Core/Providers/BottomNavBarProvider.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:wias/UI/Screens/SplashScreen/SplashScreen.dart';

class LogoutSheetWidget extends StatelessWidget {
  const LogoutSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 288.h,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            width: 36.w,
            child: Divider(color: blackColor.withOpacity(0.3)),
          ),
          SizedBox(height: 20.h),
          poppinsText(
            text: 'Logout',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 10.h),
          Divider(
            color: blackColor,
            indent: 30.w,
            endIndent: 30.w,
          ),
          SizedBox(height: 30.h),
          poppinsText(
            text: 'Are you sure you to logout from the app',
            fontSize: 15.sp,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 161.w,
                  height: 42.h,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Color(0xffE6EBF2),
                  ),
                  child: Center(
                    child: poppinsText(
                      text: 'Cancel',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              GestureDetector(
                onTap: () async {
                  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
                  await _googleSignIn.signOut();
                  var auth = FirebaseAuth.instance;
                  await auth.signOut();
                  Get.back();
                  Provider.of<BottomNavProvider>(context, listen: false)
                      .changeScreen(0);
                  Get.offAll(() => LoginScreen());
                },
                child: Container(
                  width: 135.w,
                  height: 36.h,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Color(0xff8E8870),
                      ),
                    ),
                  ),
                  child: Center(
                    child: poppinsText(
                      text: 'Yes, Logout',
                      fontSize: 16.sp,
                      color: Color(0xff8E8870),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

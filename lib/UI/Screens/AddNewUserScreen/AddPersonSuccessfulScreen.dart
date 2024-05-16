import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddNewUserViewModel.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class AddPersonSuccessfulScreen extends StatefulWidget {
  @override
  State<AddPersonSuccessfulScreen> createState() =>
      _AddPersonSuccessfulScreenState();
}

class _AddPersonSuccessfulScreenState extends State<AddPersonSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final addNewUserProvider = Provider.of<AddNewUserModel>(context);

    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              successfullyAddedPersonImage,
              width: 280.w,
              height: 260.h,
            ),
            SizedBox(height: 60.h),
            poppinsText(
              text: 'Added Successfully',
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: poppinsText(
                text: addNewUserProvider.value == PersonType.special
                    ? 'Instructions for how to use the app \nare sent to the special person email'
                    : 'Instructions for how to use the app \nare sent to the trusted person email',
                fontSize: 18.sp,
                color: Color(0xff7E7E7E),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                poppinsText(
                  text: userData!.ownerpin!.toString(),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                poppinsText(
                  text: ' is your pin',
                  fontSize: 18.sp,
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                poppinsText(
                  text: addNewUserProvider.value == PersonType.special
                      ? addNewUserProvider.specialPerson!.specialpersonPin!
                          .toString()
                      : addNewUserProvider.trustedPerson!.specialpersonPin!
                          .toString(),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                poppinsText(
                  text: addNewUserProvider.value == PersonType.special
                      ? ' is special person pin'
                      : ' is trusted person pin',
                  fontSize: 18.sp,
                ),
              ],
            ),
            SizedBox(height: 80.h),
            GestureDetector(
              onTap: () {
                //TODO: Add function here.
                Get.offAll(() => MainBottomNavigationScreen());
              },
              child: CustomButtonWithCenterTitleWidget(title: 'Done'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Core/Constants/colors.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/CustomTextFieldWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/ProfileScreen/ProfileViewModel.dart';
import 'package:wias/services/firebase/firebase_services.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
      var profileProvider = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
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
                            text: 'Profile',
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          //ONLY for Alignment
                          Icon(Icons.send, color: Colors.transparent),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [

                           if(  userData!.picUrl != "")
                  CircleAvatar(
      radius: 60, // Adjust the size of the circle as needed
      backgroundImage: NetworkImage(  userData!.picUrl!),
      backgroundColor: Colors.transparent
      , // Fallback color if the image fails to load
    ),
                   if(  userData!.picUrl == "")
                                  CircleAvatar(
      radius: 60, // Adjust the size of the circle as needed
      child: Icon(Icons.person_add_alt_1,color: const Color.fromARGB(206, 158, 158, 158),size: 60,),
      backgroundColor: Colors.white, // Fallback color if the image fails to load
    ),
                          // Image.asset(
                          //   lollaSmithImage,
                          //   width: 136.w,
                          //   height: 136.w,
                          // ),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              poppinsText(
                                text: userData!.username!,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 8.h),
                              poppinsText(
                                text: userData!.email!,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(personDetailScreenCurvedImage),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: poppinsText(
                        text: 'Pin: '+userData!.ownerpin.toString(),
                        color: whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWithTitleWidget(
                  controller: profileProvider.emailController,
                  hintText: 'yourname@gmail.com',
                  leadingIcon: emailIcon,
                  title: 'Email Address',
                  width: 360.w,
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWithTitleWidget(
                  controller:  profileProvider.userNameController,
                  hintText: 'Username',
                  leadingIcon: personIcon,
                  title: 'Username',
                  width: 360.w,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 360.w,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: poppinsText(
                          text: 'Phone Number',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      IntlPhoneField(
                        controller: profileProvider.phoneNumberController,
                        keyboardType: TextInputType.number,
                        showDropdownIcon: false,
                        decoration: InputDecoration(
                          hintText: 'Input your number',
                          hintStyle: poppinsTextStyle(
                            fontSize: 16.sp,
                            color: blackColor.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        initialCountryCode: 'US',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ],
                  ),
                ),
                CustomTextFieldWithTitleWidget(
                  controller: profileProvider.passwordController,
                  hintText: '**********',
                  leadingIcon: keyIcon,
                  title: 'Password',
                  width: 360.w,
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    //TODO: add function here.
                    Get.back();
                  },
                  child:
                      CustomButtonWithCenterTitleWidget(title: 'Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

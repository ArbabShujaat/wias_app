import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddNewUserViewModel.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/WriteAMessageToNewPersonScreen.dart';
import 'package:wias/UI/Screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddNewUserScreen extends StatefulWidget {
  @override
  State<AddNewUserScreen> createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  bool isphoneValid = false;
  String phoneNumber = "";
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final addNewUserProvider =
        Provider.of<AddNewUserModel>(context, listen: false);

    setState(() {
      addNewUserProvider.disposeValues();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addNewUserProvider = Provider.of<AddNewUserModel>(context);
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                          text: 'Add New Person',
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => NotificationsScreen());
                          },
                          child: Image.asset(
                            notificationIcon,
                            width: 36.w,
                            height: 36.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      width: 370.w,
                      height: 200.h,
                      child: InkWell(
                        onTap: () {
                          addNewUserProvider.getImage();
                        },
                        child: addNewUserProvider.image == null
                            ? Image.asset(
                                imagePickImage,
                                width: 370.w,
                                height: 200.h,
                              )
                            : Image.file(
                                addNewUserProvider.image!,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: poppinsText(
                        text: 'Enter Details',
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFieldWidget(
                      hintText: 'yourname@gmail.com',
                      validator: (value) {
                        if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value.toString()) ==
                            false) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      leadingIcon: emailIcon,
                      controller: addNewUserProvider.emailController,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFieldWidget(
                      hintText: '@yourname',
                      leadingIcon: personIcon,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                      controller: addNewUserProvider.userNameController,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 60,
                      child: IntlPhoneField(
                        controller: addNewUserProvider.numberController,
                        keyboardType: TextInputType.number,
                        showDropdownIcon: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Input your number',
                          hintStyle: poppinsTextStyle(
                            fontSize: 16.sp,
                            color: blackColor.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        initialCountryCode: 'US',
                        onChanged: (phone) {
                          phoneNumber = phone.completeNumber.toString();
                          print(phone.completeNumber);
                          isphoneValid = phone.isValidNumber();
                        },
                      ),
                    ),
                    // CustomTextFieldWidget(
                    //   hintText: '+92............',
                    //   leadingIcon: personIcon,
                    //   controller: addNewUserProvider.numberController,
                    // ),
                    SizedBox(height: 35.h),
                    GestureDetector(
                      onTap: () {
                        //TODO: add function here.
                        setState(() {});
                        addNewUserProvider.value = PersonType.special;
                      },
                      child: Container(
                        width: 363.w,
                        height: 63.h,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color(0xffBA4F74).withOpacity(0.31),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: addNewUserProvider.value ==
                                        PersonType.special
                                    ? Color(0xffBA4F74)
                                    : Colors.transparent,
                                // Color(0xffBA4F74),
                                border: Border.all(
                                  color: Color(0xffBA4F74),
                                  width: 2.5,
                                ),
                              ),
                            ),
                            SizedBox(width: 25.w),
                            poppinsText(
                              text: 'Special Person',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBA4F74),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap: () {
                        //TODO: add function here.
                        setState(() {});
                        addNewUserProvider.value = PersonType.trusted;
                      },
                      child: Container(
                        width: 363.w,
                        height: 63.h,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color(0xffC65647).withOpacity(0.31),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: addNewUserProvider.value ==
                                        PersonType.trusted
                                    ? Color(0xffC65647)
                                    : Colors.transparent,
                                // Color(0xffBA4F74),
                                border: Border.all(
                                  color: Color(0xffC65647),
                                  width: 2.5,
                                ),
                              ),
                            ),
                            SizedBox(width: 25.w),
                            poppinsText(
                              text: 'Trusted Person',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBA4F74),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate() &&
                            addNewUserProvider.value != null &&
                            addNewUserProvider.image != null &&
                            isphoneValid) {
                          formKey.currentState!.save();
                          Get.to(() => WriteAMessageToNewPersonScreen(
                                addNewUserModelProvider: addNewUserProvider,
                              ));
                        } else if (addNewUserProvider.value == null) {
                          Fluttertoast.showToast(
                              msg: 'Please select a user type');
                        } else if (addNewUserProvider.image == null) {
                          Fluttertoast.showToast(
                              msg: 'Please uplaod a picture');
                        } else if (isphoneValid != true) {
                          Fluttertoast.showToast(
                              msg: 'Please enter a valid phone number');
                        }
                      },
                      child: CustomButtonWithCenterTitleWidget(title: 'Next'),
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

typedef FormValidator = String? Function(String?);

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String leadingIcon;
  final TextEditingController controller;
  final FormValidator? validator;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.validator,
    required this.leadingIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.15),
            spreadRadius: 0.1,
            blurRadius: 23.r,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: poppinsTextStyle(),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Image.asset(
              leadingIcon,
              width: 15.w,
              height: 15.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}

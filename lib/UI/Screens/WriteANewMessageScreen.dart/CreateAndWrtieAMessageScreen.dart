import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/UI/Screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/CreateAndWriteAMessage.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/widgets/AddPersonListDialogueWidget.dart';

class CreateAndWrtieAMessageScreen extends StatefulWidget {
  @override
  State<CreateAndWrtieAMessageScreen> createState() =>
      _CreateAndWrtieAMessageScreenState();
}

class _CreateAndWrtieAMessageScreenState
    extends State<CreateAndWrtieAMessageScreen> {
  final formKey = GlobalKey<FormState>();

  void initState() {
    final newMessageProvider =
        Provider.of<CreateNewMessageViewMoedl>(context, listen: false);
    newMessageProvider.disposeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newMessageProvider = Provider.of<CreateNewMessageViewMoedl>(
      context,
    );
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                        text: 'Write A Message',
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
                  TextFormField(
                    maxLines: 10,
                    maxLength: 500,
                    
                    validator: (value) {
                      print("Hiiiiii"+value.toString());
                      if (value == "") {
                              print("Hiiiiii"+value.toString());
                        return 'Messsage cannot be empty';
                      }

                      return null;
                    },
                    
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: newMessageProvider.messageController,
                    style: poppinsTextStyle(fontSize: 12.sp),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 10.h),
                      hintText: 'Write your message here.......',
                      hintStyle: poppinsTextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff7E7E7E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      poppinsText(
                        text: 'Added Persons',
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO: Add function here.
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AddPersonListDialogueWidget(),
                          );
                        },
                        child: CustomButtonWithCenterTitleWidget(
                          title: 'Add New',
                          width: 84.w,
                          height: 30.h,
                          borderRadius: 10.r,
                          titleFontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 80.h),
                  GestureDetector(
                    onTap: () async {



                      
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await newMessageProvider.addNewMessage();
                      }



                     
                    },
                    child:newMessageProvider.isLoading?Center(child: CircularProgressIndicator(),): CustomButtonWithCenterTitleWidget(title: 'Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

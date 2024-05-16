import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Core/Constants/colors.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/CustomTransparentButtonWithCenterTitle.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailViewModel.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/ChangePinDialogueWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/MessageBubbleWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/QuestionWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RemovePersonDialogueBox.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/widgets/RevealPinDialogueBox.dart';

class PersonDetailsScreen extends StatefulWidget {
  final DocumentSnapshot snapshot;
  final String personType;

  const PersonDetailsScreen({
    super.key,
    required this.snapshot,
    required this.personType,
  });

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {

  @override
  void initState() {
 final personDetailsProvider= Provider.of<PersonDetailsModel>(context,listen: false);
 personDetailsProvider.getMessages(widget.snapshot);
 personDetailsProvider.getQuestions(widget.snapshot);
 personDetailsProvider.snpshot=widget.snapshot;
    super.initState();
  }
    
  @override
  Widget build(BuildContext context) {
    final personDetailsProvider= Provider.of<PersonDetailsModel>(context);
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
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
                            text: widget.personType + " Person",
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
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.snapshot["picUrl"]),
                            radius: 60.r,
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              poppinsText(
                                text: widget.snapshot["username"],
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 8.h),
                              poppinsText(
                                text: widget.snapshot["email"],
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            RevealPinDialogueBox(),
                                      );
                                    },
                                    child: CustomButtonWithCenterTitleWidget(
                                      width: 87.w,
                                      height: 31.h,
                                      borderRadius: 10.r,
                                      titleFontSize: 12.sp,
                                      title: 'Reveal Pin',
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            RemovePersonDialogueBox(snapshot: widget.snapshot,),
                                      );
                                    },
                                    child:
                                        CustomTransparentButtonWithCenterTitle(
                                      width: 87.w,
                                      height: 31.h,
                                      borderRadius: 10.r,
                                      titleFontSize: 12.sp,
                                      title: 'Remove',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(personDetailScreenCurvedImage),
                    InkWell(
                      onTap: (){
                          showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ChangePinDialogueWidget(),
                                      );



                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 30.h),
                            child: poppinsText(
                              text: 'Pin: ' +
                                  widget.snapshot["ownerPin"].toString(),
                              color: whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          Padding(
                             padding: EdgeInsets.only(bottom: 30.h,left: 10.w),
                            child: Icon(Icons.edit,color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          poppinsText(
                            text: 'Messages',
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                    
                      ListView.builder(
                        itemCount: personDetailsProvider.messages!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MessageBubbleWidget(
                            index: index,

                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      if (widget.personType == "Trusted")
                        Row(
                          children: [
                            poppinsText(
                              text: 'Questions',
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      SizedBox(height: 20.h),
                      if (widget.personType == "Trusted")
                        ListView.builder(
                          itemCount: personDetailsProvider.questions!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return QuestionWidget(
                                              index: index,
                            provider: personDetailsProvider,
                            snapshot: widget.snapshot,
                            );
                          },
                        ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/Strings.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Model/QuestionChunksModel.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/AddOrEditQuestionsScreen/widgets/AddNewQuestionDialogue.dart';
import 'package:wias/UI/Screens/AddOrEditQuestionsScreen/widgets/QuestionsFieldWithEditOptionListWidget.dart';

class AddOrEditQuestionsScreen extends StatefulWidget {
  @override
  State<AddOrEditQuestionsScreen> createState() =>
      _AddOrEditQuestionsScreenState();
}

class _AddOrEditQuestionsScreenState extends State<AddOrEditQuestionsScreen> {
  PageController pageviewController = PageController();
  int currentPageViewIndex = 0;
  void currentPage(int index) {
    setState(() {});
    currentPageViewIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    List questionChunks = chunkQuestions(questionsList, 5);
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 120.h),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            //TODO: add function here.
            showDialog(
              context: context,
              builder: (BuildContext context) => AddNewQuestionDialogue(),
            );
          },
          child: Image.asset(
            addIcon,
            width: 65.w,
            height: 65.w,
          ),
        ),
      ),
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 1.sh,
                width: 1.sw,
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
                          text: 'Answer the questions',
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        //ONLY FOR ALIGNMENT
                        Icon(
                          Icons.send,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      height: 0.75.sh,
                      child: PageView.builder(
                        itemCount: questionChunks.length,
                        onPageChanged: (index) {
                          currentPage(index);
                        },
                        controller: pageviewController,
                        itemBuilder: (context, index) {
                          return QuestionsFieldWithEditOptionListWidget(
                            questions: questionChunks[index],
                            pageviewIndex: index,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentPageViewIndex == 0
                            ? SizedBox(
                                width: 55.w,
                                height: 25.h,
                              )
                            : GestureDetector(
                                onTap: () {
                                  //TODO: Add function here.
                                  pageviewController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: CustomButtonWithCenterTitleWidget(
                                  title: 'Back',
                                  width: 55.w,
                                  height: 25.h,
                                  borderRadius: 5.r,
                                  titleFontSize: 12.sp,
                                ),
                              ),
                        SizedBox(
                          height: 25.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: questionChunks.length,
                            itemBuilder: (context, index) {
                              return currentPageViewIndex == index
                                  ? Container(
                                      width: 20.w,
                                      height: 24.h,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff9C3FE4),
                                            Color(0xffC65647),
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: poppinsText(
                                          text: (index + 1).toString(),
                                          fontSize: 18.sp,
                                          color: whiteColor,
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: poppinsText(
                                        text: (index + 1).toString(),
                                        fontSize: 18.sp,
                                      ),
                                    );
                            },
                          ),
                        ),
                        currentPageViewIndex + 1 == questionChunks.length
                            ? SizedBox(
                                width: 55.w,
                                height: 25.h,
                              )
                            : GestureDetector(
                                onTap: () {
                                  //TODO: Add function here.
                                  pageviewController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: CustomButtonWithCenterTitleWidget(
                                  title: 'Next',
                                  width: 55.w,
                                  height: 25.h,
                                  borderRadius: 5.r,
                                  titleFontSize: 12.sp,
                                ),
                              ),
                      ],
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

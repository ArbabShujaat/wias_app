import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/Strings.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Model/QuestionChunksModel.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddNewUserViewModel.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddPersonSuccessfulScreen.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/widgets/QuestionsListChunkWithSelectionWidget.dart';

class AnswerQuestionScreen extends StatefulWidget {
  @override
  State<AnswerQuestionScreen> createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  PageController pageviewController = PageController();
  int currentPageViewIndex = 0;
  bool isLoading = true;
  void currentPage(int index) {
    setState(() {});
    currentPageViewIndex = index;
  }

  @override
  void initState() {
    final QuestionProvider =
        Provider.of<AddNewUserModel>(context, listen: false);
    QuestionProvider.fetchQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QuestionProvider = Provider.of<AddNewUserModel>(
      context,
    );
    List<List<String>> questionChunks =
        chunkQuestions(QuestionProvider.questions, 5);
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: QuestionProvider.isLoading
            ? Center(
                child: Center(child: CircularProgressIndicator()),
              )
            : SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SingleChildScrollView(
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
                              return QuestionsWithSelectionChunkListWidget(
                                questions: questionChunks[index],
                                pageviewIndex: index,
                                provider: QuestionProvider,
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
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3.w),
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w),
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
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            if (QuestionProvider
                                .combinedQuestionAnswer.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "Atleast select one question!!",
                                // toastLength: Toast
                                //     .LENGTH_SHORT, // or Toast.LENGTH_LONG
                                gravity:
                                    ToastGravity.BOTTOM, // Top, Center, Bottom
                                timeInSecForIosWeb:
                                    1, // Time duration for iOS and web
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            } else{
                                   Fluttertoast.showToast(
                                msg:QuestionProvider.combinedQuestionAnswer.length.toString()+ " question assigned to your trusted person",
                                // toastLength: Toast
                                //     .LENGTH_SHORT, // or Toast.LENGTH_LONG
                                gravity:
                                    ToastGravity.BOTTOM, // Top, Center, Bottom
                                timeInSecForIosWeb:
                                    1, // Time duration for iOS and web
                                backgroundColor: primaryPurpleColor,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                                         Get.back(); 
                            }
                         

               
                          },
                          child:
                              CustomButtonWithCenterTitleWidget(title: 'Add'),
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

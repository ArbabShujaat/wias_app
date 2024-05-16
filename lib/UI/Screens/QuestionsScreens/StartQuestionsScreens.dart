import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Strings.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Model/QuestionChunksModel.dart';
import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/UI/Screens/QuestionsScreens/StartQuestionsViewModel.dart';
import 'package:wias/UI/Screens/QuestionsScreens/widgets/QuestionsFieldWidget.dart';

class QuestionsScreens extends StatefulWidget {
  @override
  State<QuestionsScreens> createState() => _QuestionsScreensState();
}

class _QuestionsScreensState extends State<QuestionsScreens> {
  int currentPageViewIndex = 0;
  PageController pageviewController = PageController();

  // List<TextEditingController> answerControllers = [];

  void currentPage(int index) {
    setState(() {});
    currentPageViewIndex = index;
  }

  @override
  void initState() {
    final startQuestionProvider =
        Provider.of<StartQuestionsModel>(context, listen: false);
    startQuestionProvider.fetchQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startQuestionProvider = Provider.of<StartQuestionsModel>(
      context,
    );
    List<List<String>> questionChunks =
        chunkQuestions(startQuestionProvider.questions, 5);

    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: startQuestionProvider.isLoading
              ? Center(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: currentPageViewIndex == 0 ? false : true,
                              child: Transform.rotate(
                                angle: 110,
                                child: GestureDetector(
                                  onTap: () {
                                    pageviewController.previousPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Icon(Icons.send),
                                ),
                              ),
                            ),
                            poppinsText(
                              text: 'Answer the questions',
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            //<<<<<Only for alignment<<<<<
                            Visibility(
                              visible: currentPageViewIndex == 0 ? false : true,
                              child: Transform.rotate(
                                angle: 110,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          height: 0.95.sh,
                          child: PageView.builder(
                            itemCount: questionChunks.length,
                            onPageChanged: (index) {
                              currentPage(index);
                            },
                            controller: pageviewController,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  QuestionsListChunkWidget(
                                    questions: questionChunks[index],
                                    pageviewIndex: index,
                                    provider: startQuestionProvider,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //TODO: add function here
                                      (startQuestionProvider.questions.length /
                                                      5)
                                                  .ceil() ==
                                              index + 1
                                          ? {
                                              startQuestionProvider
                                                  .uploadQuestions(
                                                      startQuestionProvider)
                                            }
                                          : pageviewController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
                                    },
                                    child: startQuestionProvider.isLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : CustomButtonWithCenterTitleWidget(
                                            title: 'Next',
                                          ),
                                  ),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      //TODO: Add function here
                                      Get.offAll(
                                          () => MainBottomNavigationScreen());
                                    },
                                    child: poppinsText(
                                      text: 'Skip',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class QuestionsListChunkWidget extends StatefulWidget {
  final List<String> questions;
  final int pageviewIndex;
  final StartQuestionsModel provider;

  QuestionsListChunkWidget({
    required this.questions,
    required this.pageviewIndex,
    required this.provider,
  });

  @override
  State<QuestionsListChunkWidget> createState() =>
      _QuestionsListChunkWidgetState();
}

class _QuestionsListChunkWidgetState extends State<QuestionsListChunkWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.questions.length,
      itemBuilder: (context, index) {
        return QuestionsFieldWidget(
          question: widget.questions[index],
          provider: widget.provider,
          questionNumber: (widget.pageviewIndex * 5) + (index + 1),
        );
      },
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:wias/Core/Constants/Strings.dart';
// import 'package:wias/Core/Constants/TextStyles.dart';
// import 'package:wias/Model/QuestionChunksModel.dart';
// import 'package:wias/UI/CustomWidgets/CustomButtonWidgetCenterTitleWidget.dart';
// import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
// import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
// import 'package:wias/UI/Screens/QuestionsScreens/widgets/QuestionsFieldWidget.dart';

// import 'StartQuestionsViewModel.dart';

// class QuestionsScreens extends StatefulWidget {
//   @override
//   State<QuestionsScreens> createState() => _QuestionsScreensState();
// }

// class _QuestionsScreensState extends State<QuestionsScreens> {
//   int currentPageViewIndex = 0;
//   PageController pageviewController = PageController();

//   void currentPage(int index) {
//     setState(() {});
//     currentPageViewIndex = index;
//   }

//   @override
//   void initState() {
//     final startQuestionProvider =
//         Provider.of<StartQuestionsModel>(context, listen: false);
//     startQuestionProvider.fetchQuestions();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final startQuestionProvider = Provider.of<StartQuestionsModel>(
//       context,
//     );
//     List questionChunks = chunkQuestions(startQuestionProvider.questions, 5);
    
    

//     return Scaffold(
//       body: GlobalAppBackgroundWidget(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: startQuestionProvider.isLoading
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(height: 20.h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Visibility(
//                               visible: currentPageViewIndex == 0 ? false : true,
//                               child: Transform.rotate(
//                                 angle: 110,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     //TODO: add function here.
//                                     pageviewController.previousPage(
//                                       duration: Duration(milliseconds: 500),
//                                       curve: Curves.easeInOut,
//                                     );
//                                   },
//                                   child: Icon(Icons.send),
//                                 ),
//                               ),
//                             ),
//                             poppinsText(
//                               text: 'Answer the questions',
//                               fontSize: 21.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             //<<<<<Only for alignment<<<<<
//                             Visibility(
//                               visible: currentPageViewIndex == 0 ? false : true,
//                               child: Transform.rotate(
//                                 angle: 110,
//                                 child: Icon(
//                                   Icons.send,
//                                   color: Colors.transparent,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 30.h),
//                         SizedBox(
//                           height: 0.95.sh,
//                           child: PageView.builder(
//                             onPageChanged: (index) {
//                               currentPage(index);
//                             },
//                             controller: pageviewController,
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   QuestionsListChunkWidget(
//                                     questions: questionChunks,
//                                     pageviewIndex: index,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       //TODO: add function here
//                                       (questionsList.length / 5).ceil() ==
//                                               index + 1
//                                           ? Get.offAll(() =>
//                                               MainBottomNavigationScreen())
//                                           : pageviewController.nextPage(
//                                               duration:
//                                                   Duration(milliseconds: 500),
//                                               curve: Curves.easeInOut,
//                                             );
//                                     },
//                                     child: CustomButtonWithCenterTitleWidget(
//                                       title: 'Next',
//                                     ),
//                                   ),
//                                   SizedBox(height: 10.h),
//                                   GestureDetector(
//                                     behavior: HitTestBehavior.opaque,
//                                     onTap: () {
//                                       //TODO: Add function here
//                                       Get.offAll(
//                                           () => MainBottomNavigationScreen());
//                                     },
//                                     child: poppinsText(
//                                       text: 'Skip',
//                                       fontSize: 18.sp,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   )
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuestionsListChunkWidget extends StatelessWidget {
//   final List questions;
//   final int pageviewIndex;

//   QuestionsListChunkWidget({
//     required this.questions,
//     required this.pageviewIndex,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: questions.length,
//       itemBuilder: (context, index) {
//         return QuestionsFieldWidget(
//           question: questions[pageviewIndex][index]["Question"],
//           questionNumber: (pageviewIndex * 5) + (index + 1),
//         );
//       },
//     );
//   }
// }

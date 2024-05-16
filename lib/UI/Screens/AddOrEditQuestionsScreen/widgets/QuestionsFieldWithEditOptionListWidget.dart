import 'package:flutter/material.dart';
import 'package:wias/UI/Screens/AddOrEditQuestionsScreen/widgets/QuestionsFieldWithEditOptionWidget.dart';

class QuestionsFieldWithEditOptionListWidget extends StatelessWidget {
  final List<String> questions;
  final int pageviewIndex;

  QuestionsFieldWithEditOptionListWidget({
    required this.questions,
    required this.pageviewIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionsFieldWithEditOptionWidget(
          question: questions[index],
          questionNumber: (pageviewIndex * 5) + (index + 1),
        );
      },
    );
  }
}

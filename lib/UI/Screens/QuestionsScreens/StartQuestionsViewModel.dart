import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class StartQuestionsModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<String> questions = [];

  List<TextEditingController> answerControllers = [];

  List combinedQuestionAnswer = [];

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> uploadQuestions(
      StartQuestionsModel startQuestionProvider) async {
    changeLoadingState();
    for (int i = 0; i < startQuestionProvider.answerControllers.length; i++) {
      if (startQuestionProvider.answerControllers[i].text != "") {
        startQuestionProvider.combinedQuestionAnswer.add({
          "Question": startQuestionProvider.questions[i],
          "Answer": startQuestionProvider.answerControllers[i].text
        });
      }
    }
    print(startQuestionProvider.combinedQuestionAnswer);

    await FirebaseDBService()
        .saveQuestions(startQuestionProvider.combinedQuestionAnswer);

    Get.offAll(() => MainBottomNavigationScreen());

    changeLoadingState();
  }

  Future<void> fetchQuestions() async {
    changeLoadingState();
    questions = await FirebaseDBService().fetchQuestion();
    for (int i = 0; i < questions.length; i++) {
      answerControllers.add(TextEditingController(text: ""));

      print(answerControllers.length);
    }
    changeLoadingState();
    print(questions);
  }
}

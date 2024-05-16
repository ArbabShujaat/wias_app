import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class PersonDetailsModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  DocumentSnapshot? snpshot;

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  List? questions;
  List? messages;

  Future<void> getQuestions(DocumentSnapshot snapshot) async {
    questions = snapshot["questions"];
    notifyListeners();
  }

  Future<void> getMessages(DocumentSnapshot snapshot) async {
    messages = snapshot["messages"];
    notifyListeners();
  }

  Future<void> deleteMessage(int index) async {

    await FirebaseDBService().removeMessage(messages![index], snpshot!);
        messages!.removeAt(index);
    notifyListeners();
  }

  Future<void> deleteQuestion(int index, DocumentSnapshot snapshot,
      String Question, String Answer) async {
    questions!.removeAt(index);
    await FirebaseDBService().removeQuestion(Question, Answer, snapshot);
    notifyListeners();
  }
}

import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wias/Model/SpecialPersonModel.dart';
import 'package:wias/Model/TrustedPersonModel.dart';
import 'package:wias/services/firebase/firebase_services.dart';

enum PersonType { special, trusted }

class AddNewUserModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  PersonType? value;

  SpecialPersonModel? specialPerson;
  TrustedPersonModel? trustedPerson;
  List<String> questions = [];
  List<TextEditingController> answerControllers = [];
  final _random = Random();
  int? _randomPin;
  List combinedQuestionAnswer = [];

  void disposeValues() {
    emailController = TextEditingController();
    userNameController = TextEditingController();
    numberController = TextEditingController();
    messageController = TextEditingController();
    questions = [];
    value = null;
    specialPerson = null;
    image = null;
    answerControllers = [];
    combinedQuestionAnswer = [];
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  File? image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<void> _generateRandomPin(String collection) async {
    // Generate a random 4-digit PIN
    _randomPin = _random.nextInt(9000) + 1000;

    // Check if the generated PIN exists in Firestore
    await _checkPinExistence(_randomPin!,collection);
  }

  Future<void> _checkPinExistence(int pin, String collection) async {
    final pinSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userData!.uid)
        .collection(collection)
        .where("ownerPin", isEqualTo: pin.toString())
        .get();
    final pinSnapshot2 = await FirebaseFirestore.instance
        .collection('users')
        .doc(userData!.uid)
        .collection(collection)
        .where("specialpersonPin", isEqualTo: pin.toString())
        .get();
    if (pinSnapshot.docs.length > 0 && pinSnapshot2.docs.length > 0) {
      _generateRandomPin(collection);
    } else {}
  }

  Future<void> uploadDataSpecialPerson() async {
    changeLoadingState();
    await _generateRandomPin("SpecialAndTrustedPerson");
    await FirebaseDBService().uploadImageToStorage(image!).then((value) async {
      specialPerson = SpecialPersonModel(
          uid: "uid",
          email: emailController.text,
          phone: numberController.text,
          Type: "Special",
          specialpersonPin: _randomPin,
          messages: [messageController.text],
          createdAt: DateTime.now(),
          ownerPin: userData!.ownerpin,
          picUrl: value,
          username: userNameController.text);
      await FirebaseDBService().addNewSpecialPerson(specialPerson!);
    });

    changeLoadingState();
  }

  Future<void> uploadDataTrustedPerson() async {

    changeLoadingState();
      await _generateRandomPin("SpecialAndTrustedPerson");
 print("hiiiiiii111"+combinedQuestionAnswer.toString()) ;
    await FirebaseDBService().uploadImageToStorage(image!).then((value) async {
      trustedPerson = TrustedPersonModel(
          uid: "uid",
          email: emailController.text,
          Type: "Trusted",
          phone: numberController.text,
          specialpersonPin: _randomPin,
          messages: [messageController.text],
          questions: combinedQuestionAnswer,
          createdAt: DateTime.now(),
          ownerPin: userData!.ownerpin,
          picUrl: value,
          username: userNameController.text);
      await FirebaseDBService().addNewTrustedPerson(trustedPerson!);
    });

    changeLoadingState();
  }

  Future<void> uploadQuestions() async {
    changeLoadingState();
    for (int i = 0; i < answerControllers.length; i++) {
      if (answerControllers[i].text != "") {
        combinedQuestionAnswer.add(
            {"Question": questions[i], "Answer": answerControllers[i].text});
      }
    }
    print(combinedQuestionAnswer);

    await FirebaseDBService().saveQuestions(combinedQuestionAnswer);

    changeLoadingState();
  }

  Future<void> fetchQuestions() async {
    changeLoadingState();
    answerControllers = [];
    questions = [];
    List answerplusquestion = [];
    answerplusquestion = await FirebaseDBService().fetchindividualQuestion();
    for (int i = 0; i < answerplusquestion.length; i++) {
      answerControllers
          .add(TextEditingController(text: answerplusquestion[i]["Answer"]));
      questions.add(answerplusquestion[i]["Question"]);

      print(answerControllers.length);
    }
    changeLoadingState();
    print(questions);
  }
}

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier{

    bool _isLoading = false;
  bool get isLoading => _isLoading;
  DocumentSnapshot? randomDocument;


  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  HomeViewModel(){
    _getRandomDocument();
  }

    Future<void> _getRandomDocument() async {

      changeLoadingState();
        final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Fetch documents from Firestore collection
    QuerySnapshot querySnapshot = await firestore.collection('quotes').get();

    // Get total number of documents
    int totalDocuments = querySnapshot.docs.length;

    // Generate a random index
    int randomIndex = Random().nextInt(totalDocuments);

    // Get a random document
    randomDocument = querySnapshot.docs[randomIndex];
      changeLoadingState();



  }










}
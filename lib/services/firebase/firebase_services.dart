import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wias/Model/SpecialPersonModel.dart';
import 'package:wias/Model/TrustedPersonModel.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:wias/Model/UserModel.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/SignUpViewModel.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/MainBottomNavigationScreen.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionScreen.dart';

UserModel? userData;

class FirebaseDBService {
  // Firebase-related operations (authentication, database interactions, etc.)

  // this is the collection name in firestore
  static var userCollection = FirebaseFirestore.instance.collection('users');

  // this is the collection name in firestore
  static var quesCollection =
      FirebaseFirestore.instance.collection('questions');
  var auth = FirebaseAuth.instance;
  // to create the used datamodel object;

  User? currentUser;

  ///User registration///////
  Future<String> registerUser(UserModel userDataModel) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: userDataModel.email!, password: userDataModel.password!);
      currentUser = auth.currentUser;
      userDataModel.uid = currentUser!.uid;
      await userCollection.doc(currentUser!.uid).set(userDataModel.toMap());
      await getUser();
      return "Sucess";
    } catch (e) {
      return e.toString();
    }
  }

  ///Getting User Data/////
  Future<void> getUser() async {
    try {
      print(auth.currentUser!.email!);
      await userCollection
          .where("email", isEqualTo: auth.currentUser!.email)
          .get()
          .then((value) async {
        String id = value.docs[0].id;
        final snapshot = await userCollection.doc(id).get();
        userData = UserModel.fromMap(snapshot.data()!);
      });
      // final snapshot = await userCollection.doc(auth.currentUser!.uid).get();
      // userData = UserModel.fromMap(snapshot.data()!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ////////User Login/////
  Future<String> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      currentUser = auth.currentUser;
      await getUser();

      return "Sucess";
    } catch (e) {
      return e.toString();
    }
  }

  ////Checking if user is already logged in/////
  Future<bool> checkUserIsLoggedIn() async {
    try {
      await auth.currentUser?.reload();
      // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      //  await _googleSignIn.signOut();
      //     await auth.signOut();

      if (auth.currentUser!.email != null) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  /////Forget password //////
  Future<String> forgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Sucess";
    } catch (e) {
      return e.toString();
    }
  }

/////Update Subscription/////
  Future<void> updateSubscription(String subscriptionType) async {
    await userCollection
        .doc(userData!.uid)
        .update({"subscription": subscriptionType});
  }

////fetch questions////
  Future<List<String>> fetchQuestion() async {
    List<String> Questions = [];

    await quesCollection.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        Questions.add(value.docs[i]["question"]);
      }
    });
    return Questions;
  }

  ////fetch individual user questions////
  Future<List> fetchindividualQuestion() async {
    List Questions = [];

    await userCollection
        .doc(userData!.uid)
        .collection("Questions")
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        Questions.add(value.docs[i]);
      }
    });
    return Questions;
  }

  ////Save questions////
  Future<void> saveQuestions(List combinedQuestionAnswerList) async {
    for (int i = 0; i < combinedQuestionAnswerList.length; i++) {
      await userCollection.doc(userData!.uid).collection("Questions").add({
        "Question": combinedQuestionAnswerList[i]["Question"],
        "Answer": combinedQuestionAnswerList[i]["Answer"],
        "Users": [],
      });
    }
  }

  ////remove question////
  Future<void> removeQuestion(
      String question, String answer, DocumentSnapshot snapshot) async {
    await userCollection
        .doc(userData!.uid)
        .collection("SpecialAndTrustedPerson")
        .doc(snapshot.id)
        .update({
      "questions": FieldValue.arrayRemove([
        {"Answer": answer, "Question": question}
      ])
    });
    print("Question from behin" + question);
    await userCollection
        .doc(userData!.uid)
        .collection("Questions")
        .where("Question", isEqualTo: question)
        .where("Answer", isEqualTo: answer)
        .get()
        .then((value) async {
      List users = value.docs[0]["Users"];

      for (int i = 0; i < users.length; i++) {
        if (users[i]["Email"] == snapshot["email"]) {
          users.removeAt(i);
          await userCollection
              .doc(userData!.uid)
              .collection("Questions")
              .doc(value.docs[0].id)
              .update({"Users": users});
        }
      }
    });
  }

  ////Add a new Message////
  Future<void> addNewMessage(List users, String message) async {
    await userCollection.doc(userData!.uid).collection("Messages").add({
      "Message": message,
      "Users": users,
    });
  }

  ////remove Message////
  Future<void> removeMessage(String message, DocumentSnapshot snapshot) async {
    await userCollection
        .doc(userData!.uid)
        .collection("SpecialAndTrustedPerson")
        .doc(snapshot.id)
        .update({
      "messages": FieldValue.arrayRemove([message])
    });
    await userCollection
        .doc(userData!.uid)
        .collection("Messages")
        .where("Message", isEqualTo: message)
        .get()
        .then((value) async {
      List users = value.docs[0]["Users"];
      for (int i = 0; i < users.length; i++) {
        if (users[i]["Email"] == snapshot["email"]) {
          users.removeAt(i);

          await userCollection
              .doc(userData!.uid)
              .collection("Messages")
              .doc(value.docs[0].id)
              .update({"Users": users});
        }
      }
    });
  }

  /////////Upload Image  to Firebase //////

  Future<String> uploadImageToStorage(File image) async {
    String url = '';
    try {
      final storageRefImage =
          FirebaseStorage.instance.ref().child('User Images').child(
                Random().nextInt(1000).toString() + DateTime.now().toString(),
              );
      UploadTask uploadTask = storageRefImage.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      await taskSnapshot.ref.getDownloadURL().then((value) {
        print("Done: $value");
        url = value;
        return url;
      });
    } catch (e) {
      print("Erorrrrrr" + e.toString());
      url = "";
      return url;
    }
    return url;
  }

  ////remove special or trusted person//////
  Future<void> removePerson(DocumentSnapshot snapshot) async {
    userCollection
        .doc(userData!.uid)
        .collection("SpecialAndTrustedPerson")
        .doc(snapshot.id)
        .delete();
  }

  /////Add new Special Person////

  Future<void> addNewSpecialPerson(SpecialPersonModel specialPerson) async {
    userCollection.doc(userData!.uid).collection("Messages").add({
      "Message": specialPerson.messages![0],
      "Users": [
        {
          "Pic": specialPerson.picUrl,
          "Name": specialPerson.username,
          "Email": specialPerson.email
        }
      ]
    });

    userCollection
        .doc(userData!.uid)
        .collection("SpecialAndTrustedPerson")
        .add(specialPerson.toMap());
  }

  /////Add new Trusted Person////

  Future<void> addNewTrustedPerson(TrustedPersonModel trustedPerson) async {
    print("hi111" + userData!.uid! + trustedPerson.messages![0]);
    userCollection.doc(userData!.uid).collection("Messages").add({
      "Message": trustedPerson.messages![0],
      "Users": [
        {
          "Pic": trustedPerson.picUrl,
          "Name": trustedPerson.username,
          "Email": trustedPerson.email
        }
      ]
    });

    for (int i = 0; i < trustedPerson.questions!.length; i++) {
      print("Hiiiiiiiii" + trustedPerson.questions![i]["Question"]);
      userCollection
          .doc(userData!.uid)
          .collection("Questions")
          .where("Question", isEqualTo: trustedPerson.questions![i]["Question"])
          .where("Answer", isEqualTo: trustedPerson.questions![i]["Answer"])
          .get()
          .then((value) {
        if (value.docs.length > 0) {
          userCollection
              .doc(userData!.uid)
              .collection("Questions")
              .doc(value.docs[0].id)
              .update({
            "Users": FieldValue.arrayUnion([
              {
                "Pic": trustedPerson.picUrl,
                "Name": trustedPerson.username,
                "Email": trustedPerson.email
              }
            ])
          });
        } else {
          userCollection.doc(userData!.uid).collection("Questions").add({
            "Question": trustedPerson.questions![i]["Question"],
            "Answer": trustedPerson.questions![i]["Answer"],
            "Users": [
              {
                "Pic": trustedPerson.picUrl,
                "Name": trustedPerson.username,
                "Email": trustedPerson.email
              }
            ]
          });
        }
      });
    }

    userCollection
        .doc(userData!.uid)
        .collection("SpecialAndTrustedPerson")
        .add(trustedPerson.toMap());
  }

//////SignIn with google///////
  Future<String> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      // Sign in with Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Successful sign-in, now authenticate with Google
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );

        print('Google Sign-In Successful2');
        final GoogleSignInAccount? currentUser = _googleSignIn.currentUser;

        try {
          await userCollection
              .where("email", isEqualTo: currentUser!.email)
              .get()
              .then((value) async {
            String id = value.docs[0].id;
            final snapshot = await userCollection.doc(id).get();
            userData = UserModel.fromMap(snapshot.data()!);
          });
          if (userData!.subscription == "")
            Get.offAll(
              SubscriptionScreen(),
            );
          else
            Get.offAll(
              MainBottomNavigationScreen(),
            );
        } catch (e) {
          UserModel userData = UserModel(
              uid: currentUser!.id,
              email: currentUser.email,
              phone: "",
              createdAt: DateTime.now(),
              password: "",
              ownerpin: 0,
              subscription: "",
              picUrl: currentUser.photoUrl ?? "",
              username: currentUser.displayName);
          await userCollection.doc(currentUser.id).set(userData.toMap());
          await getUser();
          Get.offAll(
            SubscriptionScreen(),
          );
          debugPrint(e.toString());
        }
        return "Sucess";
      } else {
        print('Google Sign-In Cancelled');
        return "Google Sign-In Cancelled";
      }
    } catch (error) {
      print('Google Sign-In Error: $error');

      return 'Google Sign-In Error: $error';
    }
  }
}

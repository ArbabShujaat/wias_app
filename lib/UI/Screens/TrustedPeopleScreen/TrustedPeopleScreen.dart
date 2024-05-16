import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/CustomWidgets/PersonCardWidget.dart';
import 'package:wias/UI/CustomWidgets/SearchBarWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailsScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';



class TrustedPeopleScreen extends StatefulWidget {
  const TrustedPeopleScreen({super.key});

  @override
  State<TrustedPeopleScreen> createState() => _TrustedPeopleScreenState();
}

class _TrustedPeopleScreenState extends State<TrustedPeopleScreen> {
    TextEditingController searchController = TextEditingController();
  String query = "";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                          //TODO: add function here.
                          Get.back();
                        },
                        child: Icon(Icons.send),
                      ),
                    ),
                    poppinsText(
                      text: 'Trusted People',
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    //ONLY for Alignment
                    Icon(Icons.send, color: Colors.transparent),
                  ],
                ),
                SizedBox(height: 40.h),
                    SizedBox(
                  width: 387.w,
                  height: 50.h,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    controller: searchController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search user',
                      alignLabelWithHint: true,
                      prefixIcon: Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.only(right: 5.w, left: 5.w),
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: primaryPurpleColor,
                          ),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide:
                            BorderSide(color: primaryPurpleColor, width: 1.5),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(color: primaryPurpleColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(

                  child: 
                      StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(userData!.uid)

                       .collection("SpecialAndTrustedPerson")
                          .where("Type",isEqualTo: "Trusted")
                  .orderBy("createdAt",descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                      height: 274.0,
                      child: Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<QueryDocumentSnapshot> items = snapshot.data!.docs;
                  return    ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                    itemBuilder: (context, index) {
                       String firebaseText = items[index]
                                      ["username"] +
                                  snapshot.data!.docs[index]["email"]+snapshot.data!.docs[index]["phone"];
                              if (!firebaseText
                                  .replaceAll(" ", "")
                                  .toLowerCase()
                                  .trim()
                                  .contains(query
                                      .replaceAll(" ", "")
                                      .toLowerCase()
                                      .trim())) {
                                return const SizedBox();
                              } else
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => PersonDetailsScreen(
                                snapshot: items[index],
                                      personType: items[index]["Type"],
                              ),
                            );
                          },
                          child: PersonCardWidget(
                            name: items[index]["username"],
                            leadingImage: items[index]["picUrl"],
                          ),
                        ),
                      );
                    },
                  );
                }}),
                  
                  
                  
               
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

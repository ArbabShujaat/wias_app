import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/CustomWidgets/SearchBarWidget.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailsScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late FocusNode myFocusNode;
  TextEditingController searchController = TextEditingController();
  String query = "";
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();

    myFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalAppBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(width: 20.w),
                        SizedBox(
                  width: 330.w,
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
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(userData!.uid)
                        .collection("SpecialAndTrustedPerson")
                        .orderBy("createdAt", descending: true)
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
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(vertical: 20.h),
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
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => PersonDetailsScreen(
                                      snapshot: items[index],
                                      personType: items[index]["Type"],
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage( items[index]["picUrl"]),
                                            ),
                                           
                                            SizedBox(width: 15.w),
                                            poppinsText(
                                              text: items[index]["username"],
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 24.sp,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: greyColor.withOpacity(0.5)),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

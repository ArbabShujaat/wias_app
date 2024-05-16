import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Model/PersonDetailsModel.dart';
import 'package:wias/UI/Screens/HomeScreen/HomeViewModel.dart';
import 'package:wias/UI/Screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailsScreen.dart';
import 'package:wias/UI/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:wias/UI/Screens/SearchScreen/SearchScreen.dart';
import 'package:wias/UI/Screens/SpecialPersonScreen/SpecialPersonScreen.dart';
import 'package:wias/UI/Screens/TrustedPeopleScreen/TrustedPeopleScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Get current time
  DateTime now = DateTime.now();



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final homeProvider= Provider.of<HomeViewModel>(context);
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SafeArea(
        bottom: false,
        child: homeProvider.isLoading
            ? Center(
                child: NutsActivityIndicator(
                  animating: true,
                  tickCount: 12,
                  activeColor: primaryPurpleColor,
                  inactiveColor: Colors.transparent,
                  endRatio: 0.6,
                  radius: 26.r,
                  startRatio: 1,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ProfileScreen());
                                },
                                child: Row(
                                  children: [
                                    if (userData!.picUrl == "")
                                      Image.asset(
                                        profileImage,
                                        width: 47.w,
                                        height: 47.w,
                                      ),
                                    if (userData!.picUrl != "")
                                      Image.network(
                                        userData!.picUrl!,
                                        width: 47.w,
                                        height: 47.w,
                                      ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        poppinsText(
                                          text: userData!.username!,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        poppinsText(
                                          text: userData!.subscription!,
                                          fontSize: 10.sp,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => SearchScreen());
                                    },
                                    child: Image.asset(
                                      searchIcon,
                                      width: 36.w,
                                      height: 36.w,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => NotificationsScreen());
                                    },
                                    child: Image.asset(
                                      notificationIcon,
                                      width: 36.w,
                                      height: 36.w,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              poppinsText(
                                text: now.hour < 12
                                    ? 'Good Morning,'
                                    : now.hour < 17
                                        ? "Good Afternoon!"
                                        : 'Good Evening!',
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              poppinsText(
                                text: userData!.username!,
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  openQuoteIcon,
                                  width: 20.w,
                                  height: 20.w,
                                ),
                              ),
                              poppinsText(
                                textAlign: TextAlign.center,
                                fontSize: 16.sp,
                                color: Color(0xff585858),
                                text: homeProvider.randomDocument!["message"]
                                // text:
                                //     'Someone sitting in the shades today because '
                                //     'someone planted a tree along time ago '
                                //     '-Warren buffett.',
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  closeQuoteIcon,
                                  width: 20.w,
                                  height: 20.w,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              poppinsText(
                                text: 'Trusted People',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  //TODO: add function here
                                  Get.to(() => TrustedPeopleScreen());
                                },
                                child: poppinsText(
                                  text: 'See All',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),

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
                  return 
                        SizedBox(
                          width: 1.sw,
                          height: 180.h,
                          child: ListView.builder(
                            itemCount: items.length,
                            padding: EdgeInsets.only(left: 15.w, right: 15.w),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => PersonDetailsScreen(
                                    snapshot: items[index],
                                      personType: items[index]["Type"],

                                    ),
                                  );
                                },
                                child: Container(
                                  width: 150.w,
                                  height: 170.h,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.26),
                                    borderRadius: BorderRadius.circular(28.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage( items[index]["picUrl"]),
                                        radius: 50.0.r,
                                      ),
                                    
                                      SizedBox(height: 5.h),
                                      poppinsText(
                                        text: items[index]["username"],
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                }}),


                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              poppinsText(
                                text: 'Special People',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  //TODO: add function here
                                  Get.to(() => SpecialPersonScreen());
                                },
                                child: poppinsText(
                                  text: 'See All',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                                     StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(userData!.uid)
                  .collection("SpecialAndTrustedPerson")
                          .where("Type",isEqualTo: "Special")
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
                  return 
                        SizedBox(
                          width: 1.sw,
                          height: 180.h,
                          child: ListView.builder(
                            itemCount: items.length,
                            padding: EdgeInsets.only(left: 15.w, right: 15.w),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => PersonDetailsScreen(
                                     snapshot: items[index],
                                      personType: items[index]["Type"],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 150.w,
                                  height: 170.h,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.26),
                                    borderRadius: BorderRadius.circular(28.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage( items[index]["picUrl"]),
                                        radius: 50.0.r,
                                      ),
                                    
                                      SizedBox(height: 5.h),
                                      poppinsText(
                                        text: items[index]["username"],
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                }}),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

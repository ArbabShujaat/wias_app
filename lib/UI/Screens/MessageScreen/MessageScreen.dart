import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/TextStyles.dart';
import 'package:wias/Core/Constants/colors.dart';
import 'package:wias/UI/CustomWidgets/SearchBarWidget.dart';
import 'package:wias/UI/Screens/MessageScreen/MessageDetailsScreen.dart';
import 'package:wias/UI/Screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:wias/services/firebase/firebase_services.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //<<<<<ONLY FOR ALignment<<<<<
                    Icon(Icons.send, color: Colors.transparent),
                    poppinsText(
                      text: 'Messages',
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
                ),
                SizedBox(height: 40.h),
                SearchBarWidget(
                  searchController: searchController,
                  width: 387.w,
                ),
                SizedBox(height: 17.w),
                poppinsText(
                  text: 'Messages you want to convey to love ones',
                  fontSize: 16.sp,
                  color: Color(0xff7E7E7E),
                ),
                SizedBox(height: 30.w),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(userData!.uid)
                        .collection("Messages")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 225.h,
                          width: 1.sw,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            'Error loading data',
                          ),
                        );
                      }

                      var data = snapshot.data!.docs;
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => MessageDetailsScreen());
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    BubbleSpecialThree(
                                      
                                      text: data[index]["Message"],
                                      textStyle: poppinsTextStyle(
                                        color: whiteColor,
                                        fontSize: 16.sp,
                                      ),
                                      color: primaryPurpleColor,
                                      constraints:
                                          BoxConstraints(minWidth: 1.sw,minHeight: 50.h),
                                      tail: true,
                                      isSender: false,
                                    ),

                                    //      Positioned(
                                    //     bottom: -10.h,
                                    //     right: 5.w,

                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                    //     children: [

                                    //      for(int i=0; i< data[index]["Users"].length+10;i++ )
                                    //      if(i<4)
                                    //            Stack(
                                    //              children: [
                                    //                Container(
                                    //                  width: 29.w,
                                    //                  height: 29.w,
                                    //                  decoration:
                                    //                      BoxDecoration(shape: BoxShape.circle,color: Color(0xffE4E4E4),),
                                    //                  child:i==3? Center(
                                    //                                                    child: poppinsText(
                                    //                                                      text: "+"+(data[index]["Users"].length-3).toString(),
                                    //                                                      fontSize: 10.sp,
                                    //                                                      fontWeight: FontWeight.bold,
                                    //                                                      color: Color(0xff767676),
                                    //                                                    ),
                                    //                                                  ): Image.asset(personImage),
                                    //                ),
                                    //              ],
                                    //            ),

                                    //   ],),
                                    // ),

                                    if(data[index]["Users"].length<=3)
                                         for (int i = 0;
                                        i < data[index]["Users"].length ;
                                        i++)
                                              Positioned(
                                            bottom: -10.h,
                                            right: 5 +i * 20.w,
                                            child: Container(
                                                width: 29.w,
                                                height: 29.w,
                                                decoration: BoxDecoration(
                                                  image: i != 3
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                              data[index]
                                                                      ["Users"]
                                                                  [i]["Pic"]))
                                                      : null,
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffE4E4E4),
                                                ),)),



                                    if(data[index]["Users"].length>3)

                                    for (int i = 0;
                                        i < data[index]["Users"].length ;
                                        i++)
                                      if (i < 4)
                                        Positioned(
                                            bottom: -10.h,
                                            right: 55 - i * 20.w,
                                            child: Container(
                                                width: 29.w,
                                                height: 29.w,
                                                decoration: BoxDecoration(
                                                  image: i != 3
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                              data[index]
                                                                      ["Users"]
                                                                  [i]["Pic"]))
                                                      : null,
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffE4E4E4),
                                                ),
                                                child: Center(
                                                  child: i == 3
                                                      ? poppinsText(
                                                          text: "+" +
                                                              (data[index]["Users"]
                                                                          .length -
                                                                      3)
                                                                  .toString(),
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff767676),
                                                        )
                                                      : null,
                                                )))
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Colors.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: 1.sw,
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                print('Hello');
              },
              child: Icon(Icons.accessibility_new),
            ),
            GestureDetector(
              onTap: () {
                print('Hello');
              },
              child: Icon(Icons.abc),
            ),
            GestureDetector(
              onTap: () {
                print('Hello');
              },
              child: Icon(Icons.abc),
            ),
          ],
        ),
      ),
    );
  }
}

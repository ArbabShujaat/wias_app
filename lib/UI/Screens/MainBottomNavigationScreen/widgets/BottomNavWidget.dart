import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Constants/Colors.dart';
import 'package:wias/Core/Providers/BottomNavBarProvider.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    BottomNavProvider model =
        Provider.of<BottomNavProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        // color: blackColor,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            whiteColor,
            whiteColor,
            blackColor.withOpacity(0.2),
            Colors.transparent,
          ],
        ),
      ),
      child: CustomPaint(
        painter: _CurvedPainter(),
        child: Container(
          height: 120.h,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    model.changeScreen(0);
                  },
                  child: Image.asset(
                    model.bottomNavIndex == 0 ? homeIconSelected : homeIcon,
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    model.changeScreen(1);
                  },
                  child: Image.asset(
                    model.bottomNavIndex == 1 ? favIconSelected : favIcon,
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
                SizedBox(width: size.width * 0.20),
                GestureDetector(
                  onTap: () {
                    model.changeScreen(2);
                  },
                  child: Image.asset(
                    model.bottomNavIndex == 2 ? chatIconSelected : chatIcon,
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    model.changeScreen(3);
                  },
                  child: Image.asset(
                    model.bottomNavIndex == 3
                        ? settingsIconSelected
                        : settingsIcon,
                    width: 30.w,
                    height: 30.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//? NavBar Clipper

class _CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(-1, 20);
    path_0.cubicTo(-1, 20, 130.426, 40.5, 215, 40.5);
    path_0.cubicTo(299.574, 40.5, 431, 20, 431, 10);
    path_0.lineTo(431, 104);
    path_0.lineTo(-1, 104);
    path_0.lineTo(-1, 20);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }
  // Increase curvature by moving control point higher

  // canvas.drawShadow(path, Colors.white, 5, true);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

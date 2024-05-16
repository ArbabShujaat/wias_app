import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wias/Core/Constants/Assets.dart';

class GlobalAppBackgroundWidget extends StatelessWidget {
  final Widget child;
  GlobalAppBackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(gradientBackgroundBlurImage),
        ),
      ),
      child: child,
    );
  }
}

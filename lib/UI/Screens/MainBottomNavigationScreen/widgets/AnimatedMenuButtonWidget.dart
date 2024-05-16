// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:math' as math;

// class AnimatedMenuButton extends StatelessWidget {
//   final AnimationController animationController;
//   final String icon;

//   AnimatedMenuButton({
//     required this.animationController,
//     required this.icon,
//   }) : super(key: UniqueKey());

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: animationController.value,
//       child: Image.asset(
//         icon,
//         width: 55.w,
//         height: 55.w,
//       ),
//     );

//     // AnimatedBuilder(
//     //   animation: animationController,
//     //   builder: (context, child) {
//     //     return Transform.translate(
//     //       offset: Offset(
//     //         100 * math.cos(angle) * (1 - animationController.value),
//     //         80 * math.sin(angle) * (1 - animationController.value),
//     //       ),
//     //       child: Opacity(
//     //         opacity: animationController.value,
//     //         child: Image.asset(
//     //           icon,
//     //           width: 55.w,
//     //           height: 55.w,
//     //         ),
//     //       ),
//     //     );
//     //   },
//     // );
//   }
// }

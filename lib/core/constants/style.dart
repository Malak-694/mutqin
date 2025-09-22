import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart'; // assuming AppColors is defined here

class AppStyle {
  static BoxDecoration decoration({required double? radius, }) {
    return BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(radius!.r),
      border: Border.all(color: AppColors.primery, width: 1.w),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(155, 209, 200, 178).withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

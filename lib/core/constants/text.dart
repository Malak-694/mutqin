import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';

class AppTextStyles {
  // Headlines
  static TextStyle get headline1 => TextStyle(
    fontSize: 23.sp,
    color: AppColors.background,
    fontFamily: 'Amiri',
    package: null,
  );

  static TextStyle get headline2 => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.darkprimery,
    fontFamily: 'Amiri',
  );

  // Body
  static TextStyle get body1 => TextStyle(
    fontSize: 20.sp,
    color: AppColors.background,
    fontFamily: 'Amiri',
  );

  static TextStyle get body2 => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.darkprimery,
    fontFamily: 'Amiri',
  );

  // Captions
  static TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    fontFamily: 'Amiri',
  );

  // Buttons
  static TextStyle get button => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
    fontFamily: 'Amiri',
  );
}

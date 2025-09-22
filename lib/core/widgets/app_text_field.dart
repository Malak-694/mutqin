import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/text.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.width = 383,
  });

  final TextEditingController controller;
  final String hintText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: width.w,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.right,
        minLines: 1,
        maxLines: 1,
        style: AppTextStyles.headline2,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondary,
          hintText: hintText,
          hintStyle: AppTextStyles.headline2.copyWith(
            color: AppColors.lightprimery,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.primery, width: 1.w),
          ),
          // Border when focused
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.darkprimery, width: 1.w),
          ),
          // Border when error
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.red, width: 2.w),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text.dart';

class SignGoogleButton extends StatelessWidget {
  const SignGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle Google Sign-In
      },
      icon: Icon(Icons.login, color: AppColors.background, size: 40.sp),
      label: Text(
        'Google',
        style: AppTextStyles.button.copyWith(fontSize: 30.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightprimery,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
          side: BorderSide(
            color: const Color.fromARGB(176, 255, 253, 246),
            width: 1.w,
          ),
        ),
      ),
    );
  }
}

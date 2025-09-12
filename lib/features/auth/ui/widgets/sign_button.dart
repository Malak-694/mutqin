import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';
import 'package:mutqin/core/constants/string.dart' show AppStrings;
import 'package:mutqin/core/constants/text.dart';

class SignButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final bool isLoading;
  const SignButton({
    super.key,
    this.onPressed,
    this.text,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primery,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              text ?? AppStrings.registerButton,
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
    );
  }
}

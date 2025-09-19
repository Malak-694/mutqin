
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/string.dart';
import '../constants/text.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.onPressed,
    required this.person,
  });

  final VoidCallback onPressed;
  final Map<String, String> person;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.h),
      margin: EdgeInsets.only(bottom: 10.h),
      constraints: BoxConstraints(minHeight: 71.h),
      decoration: BoxDecoration(
        color: AppColors.lightprimery,
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: AppColors.darkprimery, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
              side: BorderSide(color: AppColors.primery, width: 1.w),
            ),
            child: Text(
              AppStrings.details,
              style: AppTextStyles.headline2,
            ),
          ),
          Text(
            person["name"]!,
            style: AppTextStyles.headline1.copyWith(fontSize: 30.sp),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/router/route_names.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/string.dart';
import '../../../../core/constants/text.dart';

class SearchSheikhBar extends StatelessWidget {
  const SearchSheikhBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.sheikhSearchResults);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.background,
            fixedSize: Size(230.w, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            side: BorderSide(color: AppColors.primery, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.search, color: AppColors.primery, size: 24),
              Text(
                AppStrings.searchSheikh,
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primery,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

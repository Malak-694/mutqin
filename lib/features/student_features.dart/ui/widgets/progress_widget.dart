import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/text.dart';

import '../../../../core/constants/colors.dart';

class ProgressWidget extends StatelessWidget {
  final Map<String, String> progress;

  const ProgressWidget({super.key, required this.progress});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgressCard(
                type: "الجلسات",
                icon: Icons.laptop,
                describtion: progress.values.elementAt(0),
              ),
              ProgressCard(
                type: "عدد الصفح",
                icon: Icons.book,
                describtion: progress.values.elementAt(1),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              ProgressCard(
                type: "النقاط",
                icon: Icons.star,
                describtion: progress.values.elementAt(2),
              ),
              ProgressCard(
                type: "المدة",
                icon: Icons.alarm,
                describtion: progress.values.elementAt(3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
    required this.type,
    required this.icon,
    required this.describtion,
  });

  final String type;
  final IconData icon;
  final String describtion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.dg),
      height: 80.h,
      width: 160,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: AppColors.primery, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(155, 209, 200, 178).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(type, style: AppTextStyles.body2.copyWith(fontSize: 20.sp)),
              SizedBox(width: 5.w),
              Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  color: AppColors.primery,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.background, size: 18.h),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                describtion,
                style: AppTextStyles.headline2.copyWith(fontSize: 25.h),
              ),
              SizedBox(width: 30.w),
            ],
          ),
        ],
      ),
    );
  }
}

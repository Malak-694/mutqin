import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/text.dart';

import '../constants/colors.dart';

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
                describtion: progress["sessions"]!,
              ),
              ProgressCard(
                type: "النقاط",
                icon: Icons.star,
                describtion: progress["points"]!,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              ProgressCard(
                type: "المدة",
                icon: Icons.alarm,
                describtion: progress["duration"]!,
              ),
              ProgressCard(
                type: "عدد الصفح",
                icon: Icons.book,
                describtion: progress["pageLearned"]!,
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
      padding: EdgeInsets.all(5.w), // ✅ fixed: use w or h
      height: 80.h,
      width: 160.w,
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
              Text(
                type,
                style: AppTextStyles.body2.copyWith(
                  fontSize: 20.sp,
                ), // ✅ text = sp
              ),
              SizedBox(width: 5.w),
              Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  color: AppColors.primery,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: AppColors.background,
                  size: 18.sp, // ✅ icon size also better with sp
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                describtion,
                style: AppTextStyles.headline2.copyWith(fontSize: 25.sp),
              ),
              SizedBox(width: 30.w),
            ],
          ),
        ],
      ),
    );
  }
}

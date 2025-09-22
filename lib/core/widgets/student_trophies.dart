// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutqin/core/constants/text.dart';

import '../constants/colors.dart';

class StudentTrophies extends StatelessWidget {
  List<Map<String, String>> trophies;

  StudentTrophies({super.key, required this.trophies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(26.r),
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 👈 makes it horizontal

        itemCount: trophies.length,
        itemBuilder: (context, index) {
          final trophy = trophies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100.h,
                  width: 1.w,
                  color: AppColors.secondary,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.trophy,
                      color: AppColors.primery,
                      size: 55.h,
                    ),
                    Container(
                      width: 110.w,
                      child: Text(
                        trophy["title"]!,
                        style: AppTextStyles.body2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100.h,
                  width: 1.w,
                  color: AppColors.secondary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

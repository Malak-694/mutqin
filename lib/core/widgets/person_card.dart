import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';

import '../constants/colors.dart';
import '../constants/string.dart';
import '../constants/text.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.onPressed,
    required this.person,
    this.student = true,
  });
  String truncateText(String text, int limit) {
    if (text.length <= limit) return text;
    return "${text.substring(0, limit - 3)}...";
  }

  final Function(String tutorId) onPressed;
  final ProfileModel person;
  final bool student;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                truncateText(person.username!, 9),

                style: AppTextStyles.headline1,
                textAlign: TextAlign.start,
              ),
              if (person.email != null)
                Text(
                  truncateText(person.email!, 25),
                  style: AppTextStyles.body2,
                  textAlign: TextAlign.start,
                ),
            ],
          ),
          ElevatedButton(
            onPressed: () =>
                onPressed(student ? person.id ?? "" : (person.username ?? "")),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primery,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
              side: BorderSide(color: AppColors.primery, width: 1.w),
            ),
            child: Text(AppStrings.details, style: AppTextStyles.body1),
          ),
        ],
      ),
    );
  }
}

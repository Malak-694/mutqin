import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mutqin/core/constants/text.dart';
import 'package:mutqin/features/student_features/data/models/progress_model.dart';

import '../constants/colors.dart';

class ProgressWidget extends StatelessWidget {
  final List<ProgressModel> progresses;
  String formatArabicDate(String backendDate) {
    // parse the ISO string
    DateTime dateTime = DateTime.parse(backendDate);

    // اضبط الـ locale على العربي
    var formatter = DateFormat.yMMMMEEEEd('ar'); // يوم + شهر + سنة
    var timeFormatter = DateFormat.Hm('ar'); // الساعة والدقيقة

    String formattedDate = formatter.format(dateTime);
    String formattedTime = timeFormatter.format(dateTime);

    return "$formattedDate - $formattedTime";
  }

  const ProgressWidget({super.key, required this.progresses});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //Todo: search parameters
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          height: 270.h,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(26.r),
            border: Border.all(color: AppColors.primery, width: 1.w),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  155,
                  209,
                  200,
                  178,
                ).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: progresses.length,
            itemBuilder: (context, index) {
              final progress = progresses[index];
              return Container(
                padding: EdgeInsets.all(10.w),
                margin: EdgeInsets.only(bottom: 10.h),
                constraints: BoxConstraints(minHeight: 71.h),
                decoration: BoxDecoration(
                  color: AppColors.lightprimery,
                  borderRadius: BorderRadius.circular(11.r),
                  border: Border.all(color: AppColors.darkprimery, width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProgressCard(
                          type: "الجلسات",
                          icon: Icons.laptop,
                          describtion: progress.sessionsAttended!,
                        ),
                        ProgressCard(
                          type: "النقاط",
                          icon: Icons.star,
                          describtion: progress.points!,
                        ),
                        ProgressCard(
                          type: "عدد الصفح",
                          icon: Icons.book,
                          describtion: progress.newLearnedPages!,
                        ),
                      ],
                    ),
                    Text(
                      formatArabicDate(progress.createdAt!),
                      style: AppTextStyles.body2.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              type,
              style: AppTextStyles.body1, // ✅ text = sp
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
              style: AppTextStyles.body1.copyWith(fontSize: 25.sp),
            ),
            SizedBox(width: 30.w),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/style.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/string.dart';
import '../../core/constants/text.dart';
import '../../core/widgets/floating_nav.dart';
import '../../core/widgets/progress_widget.dart';
import '../../core/widgets/student_trophies.dart';

class SonReportScreen extends StatelessWidget {
  Map<String, String> person = {
    "name": "احمد محمد حسن علي",
    "user_name": "malakAhmed",
    "sessions": "4",
    "pageLearned": "13",
    "points": "1234",
    "duration": "اسبوعين",
    "note": "ابنك مجتهد جدا ونتمنى له المزيد من التقدم والنجاح",
  };
  final List<Map<String, String>> trophies = [
    {"title": "حفظ اول ثلاث اجزاء"},
    {"title": "حفظ ثاني ثلاث اجزاء"},
    {"title": "حفظ ثالث ثلاث اجزاء"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("مرحبا بك يا أحمد", style: AppTextStyles.headline2),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(15.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              person["name"]!,
              style: AppTextStyles.headline2.copyWith(
                fontSize: 30.sp,
                color: AppColors.primery,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 10.h),
            Text(
              person["user_name"]!,
              style: AppTextStyles.body2.copyWith(color: AppColors.primery),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 30.h),

            Text(
              AppStrings.note,
              style: AppTextStyles.headline2,
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(5.r),
              constraints: BoxConstraints(minHeight: 40.h),
              decoration: AppStyle.decoration(radius: 14),
              child: Text(
                person["note"]!,
                style: AppTextStyles.body2.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.end,
              ),
            ),

            SizedBox(height: 40.h),

         //   ProgressWidget(progress: person),
            SizedBox(height: 30.h),

            StudentTrophies(trophies: trophies),
            SizedBox(height: 30.h),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "parent", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

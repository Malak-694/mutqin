import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/string.dart';
import 'package:mutqin/core/widgets/progress_widget.dart';
import 'package:mutqin/features/sheikh_features/ui/widgets/sheikh_add_trophy.dart';
import 'package:mutqin/core/widgets/app_text_field.dart' show AppTextField;

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/helper/shared_pref_helper.dart';
import '../../../core/widgets/floating_nav.dart';

class StudentProgress extends StatefulWidget {
  @override
  State<StudentProgress> createState() => _StudentProgressState();
}

class _StudentProgressState extends State<StudentProgress> {
  @override
  void tryed() {
    // SharedPrefHelper.setData("is_logged_in", true);
    // SharedPrefHelper.getData("is_logged_in").then((value) {
    //   print("value is $value");
    // });
  }

  Widget build(BuildContext context) {
    Map<String, String> person = {
      "name": "احمد محمد حسن علي",
      "user_name": "malakAhmed",
      "sessions": "4",
      "pageLearned": "13",
      "points": "1234",
      "duration": "اسبوعين",
    };
    final List<Map<String, String>> trophies = [
      {"title": "حفظ اول ثلاث اجزاء"},
      {"title": "حفظ ثاني ثلاث اجزاء"},
      {"title": "حفظ ثالث ثلاث اجزاء"},
    ];
    final TextEditingController note = TextEditingController();
    final TextEditingController points = TextEditingController();
    final TextEditingController pages = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("مرحبا بك يا أحمد", style: AppTextStyles.headline2),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Text(
                person["user_name"]!,
                style: AppTextStyles.body2.copyWith(color: AppColors.primery),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 20.h),
              //ProgressWidget(progress: person),

              SizedBox(height: 20.h),
              SheikhAddTrophy(intialTrophies: trophies, onPressed: tryed),
              SizedBox(height: 20.h),

              AppTextField(
                controller: pages,
                hintText: AppStrings.add + AppStrings.pages,
              ),
              SizedBox(height: 20.h),
              AppTextField(
                controller: points,
                hintText: AppStrings.add + AppStrings.points,
              ),
              SizedBox(height: 20.h),
              AppTextField(controller: note, hintText: AppStrings.note),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: AppColors.secondary,

                      content: Text(
                        "هل انت متأكد من ارسال التقرير بهذه القيم؟",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body2,
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("لا", style: AppTextStyles.body2),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("نعم", style: AppTextStyles.body2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primery,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(color: AppColors.darkprimery, width: 1.w),
                ),
                child: Text(
                  AppStrings.sendReport,
                  style: AppTextStyles.headline1,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "teacher", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

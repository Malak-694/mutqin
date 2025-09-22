import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutqin/core/constants/style.dart';
import 'package:mutqin/core/widgets/app_text_field.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';

class TrophyScreen extends StatelessWidget {
  TextEditingController prize_name = TextEditingController();
  TextEditingController prize_note = TextEditingController();

  final List<Map<String, String>> trophies = [
    {"title": "حفظ اول ثلاث اجزاء"},
    {"title": "حفظ ثاني ثلاث اجزاء"},
    {"title": "حفظ ثالث ثلاث اجزاء"},
    {"title": "حفظ اول ثلاث اجزاء"},
    {"title": "حفظ ثاني ثلاث اجزاء"},
    {"title": "حفظ ثالث ثلاث اجزاء"},
    {"title": "حفظ اول ثلاث اجزاء"},
    {"title": "حفظ ثاني ثلاث اجزاء"},
    {"title": "حفظ ثالث ثلاث اجزاء"},
    {"title": "حفظ اول ثلاث اجزاء"},
    {"title": "حفظ ثاني ثلاث اجزاء"},
    {"title": "حفظ ثالث ثلاث اجزاء"},
  ];
  TrophyScreen({super.key});

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
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Container(
              width: 383.w,

              height: 530.h,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primery, width: 1.w),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ListView.builder(
                itemCount: trophies.length,
                itemBuilder: (context, index) {
                  final trophy = trophies[index];
                  return Container(
                    height: 90.h,
                    width: 370.w,
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(10.0),
                    decoration: AppStyle.decoration(
                      radius: 16.r,
                    ).copyWith(color: AppColors.lightprimery),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          trophy["title"]!,
                          style: AppTextStyles.headline2,
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(width: 20.w),
                        Icon(
                          FontAwesomeIcons.trophy,
                          color: AppColors.secondary,
                          size: 60.h,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 185.h,
              width: 383.w,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextField(
                        controller: prize_name,
                        hintText: "اضافة جائزة",
                        width: 230,
                      ),
                      AppTextField(
                        controller: prize_note,
                        hintText: "اضافة ملاحظة",
                        width: 230,
                      ),
                      ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primery,
                          minimumSize: Size(85.w, 20.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          "اضافة جائزة",
                          style: AppTextStyles.headline2.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.trophy,
                        color: AppColors.primery,
                        size: 100.h,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "teacher", // Example role
        selectedIndex: 2, // Profile index
      ),
    );
  }
}

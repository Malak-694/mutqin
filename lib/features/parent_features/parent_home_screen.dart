import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/style.dart';
import 'package:mutqin/core/widgets/app_text_field.dart';
import 'package:mutqin/core/widgets/persons_list.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/string.dart';
import '../../core/constants/text.dart';
import '../../core/widgets/floating_nav.dart';

class ParentHome extends StatelessWidget {
  ParentHome({super.key});
  TextEditingController controller = TextEditingController();
  String hintText = "ادخل اسم المستخدم";
  List<Map<String, String>> persons = [
    {"name": "ملك احمد محمد", "date": "10-12-2025"},
    {"name": "محمد احمد محمد", "date": "10-12-2025"},
    {"name": "خالد احمد محمد", "date": "10-12-2025"},
    {"name": "ملك احمد محمد", "date": "10-12-2025"},
    {"name": "ملك احمد محمد", "date": "10-12-2025"},
    {"name": "محمد احمد محمد", "date": "10-12-2025"},
    {"name": "خالد احمد محمد", "date": "10-12-2025"},
    {"name": "ملك احمد محمد", "date": "10-12-2025"},
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.reports,
              style: AppTextStyles.headline2,
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 10.h),
            PersonsList(persons: persons, onPressed: () {}, height: 340),
            SizedBox(height: 40.h),
            Text(AppStrings.addSon, style: AppTextStyles.headline2),
            SizedBox(height: 10.h),

            Container(
              padding: EdgeInsets.all(12.r),
              height: 180.h,
              width: double.infinity,
              decoration: AppStyle.decoration(
                radius: 16.r,
              ).copyWith(color: AppColors.background),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppStrings.studenUsername,
                    style: AppTextStyles.headline2,
                  ),
                  AppTextField(
                    controller: controller,
                    hintText: hintText,
                    width: 300.w,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primery,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      side: BorderSide(
                        color: AppColors.darkprimery,
                        width: 1.w,
                      ),
                    ),
                    child: Text(AppStrings.add, style: AppTextStyles.body1),
                  ),
                ],
              ),
            ),
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

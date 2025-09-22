import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/style.dart';
import 'package:mutqin/core/widgets/persons_list.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text.dart';
import '../../core/widgets/floating_nav.dart';

class AdminScreen extends StatelessWidget {
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
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              children: [
                //TODO : add filter by role
              ],
            ),
            Container(
              decoration: AppStyle.decoration(radius: 15.r),
              padding: EdgeInsets.all(5.r),
              child: TextField(
                style: AppTextStyles.body2.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: AppColors.primery),
                  hintText: "ابحث عن مستخدم",
                  hintStyle: AppTextStyles.body1.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            PersonsList(persons: persons, onPressed: () {}, height: 560),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/widgets/persons_list.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../../core/widgets/session_list.dart';

class SheikhHomeScreen extends StatelessWidget {
  final List<Map<String, String>> sessions = [
    {
      "title": "[جلسة 1] تعلم التجويد",
      "status": "active",
      "date": "2023-10-01",
      "sheikhname": "احمد محمد",
    },
    {
      "title": "[جلسة 2] تعلم التجويد",
      "status": "pending",
      "date": "2023-10-05",
      "sheikhname": "علي حسن علي", // Changed from "sheikhId" to "sheikhname"
    },
    {
      "title": "[جلسة 1] تعلم التجويد",
      "status": "completed",
      "date": "2023-10-01",
      "sheikhname": "احمد محمد",
    },
    {
      "title": "[جلسة 2] تعلم التجويد",
      "status": "pending",
      "date": "2023-10-05",
      "sheikhname": "علي حسن علي", // Changed from "sheikhId" to "sheikhname"
    },
    {
      "title": "[جلسة 1] تعلم التجويد",
      "status": "completed",
      "date": "2023-10-01",
      "sheikhname": "احمد محمد",
    },
    {
      "title": "[جلسة 2] تعلم التجويد",
      "status": "pending",
      "date": "2023-10-05",
      "sheikhname": "علي حسن علي", // Changed from "sheikhId" to "sheikhname"
    },
    {
      "title": "[جلسة 1] تعلم التجويد",
      "status": "completed",
      "date": "2023-10-01",
      "sheikhname": "احمد محمد",
    },
    {
      "title": "[جلسة 2] تعلم التجويد",
      "status": "pending",
      "date": "2023-10-05",
      "sheikhname": "علي حسن علي", // Changed from "sheikhId" to "sheikhname"
    },
    {
      "title": "[جلسة 1] تعلم التجويد",
      "status": "completed",
      "date": "2023-10-01",
      "sheikhname": "احمد محمد",
    },
    {
      "title": "[جلسة 2] تعلم التجويد",
      "status": "pending",
      "date": "2023-10-05",
      "sheikhname": "علي حسن علي", // Changed from "sheikhId" to "sheikhname"
    },
  ];
  List<Map<String, String>> persons = [
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
    {"name": "ملك احمد محمد", "detail": "درس 10 طلاب"},
  ];
  final VoidCallback onPressed = () {};

  SheikhHomeScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //SessionList(sessions: sessions, height: 355),
          //  PersonsList(persons: persons, onPressed: onPressed, height: 355),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "teacher", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

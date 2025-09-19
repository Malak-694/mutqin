import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/features/student_features.dart/ui/widgets/progress_widget.dart';
import 'package:mutqin/core/widgets/session_card.dart';
import 'package:mutqin/features/student_features.dart/ui/widgets/sheikh_search.dart';
import 'package:mutqin/features/student_features.dart/ui/widgets/student_trophies.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../../core/widgets/session_list.dart';

class StudentHomescreen extends StatefulWidget {
  const StudentHomescreen({super.key});

  @override
  State<StudentHomescreen> createState() => _StudentHomescreenState();
}

class _StudentHomescreenState extends State<StudentHomescreen> {
  Map<String, String> progress = {
    "sessions": "4",
    "pageLearned": "13",
    "points": "1234",
    "duration": "اسبوعين",
  };
  final List<Map<String, String>> trophies = [
    {"title": "حفظ اول ثلاث اجزاء"},
    {"title": "حفظ ثاني ثلاث اجزاء"},
    {"title": "حفظ ثالث ثلاث اجزاء"},
    {"title": "حفظ رابع ثلاث اجزاء"},
  ];
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SearchSheikhBar(),
            SessionList(sessions: sessions),
            
            ProgressWidget(progress: progress),

            StudentTrophies(trophies: trophies),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "student", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

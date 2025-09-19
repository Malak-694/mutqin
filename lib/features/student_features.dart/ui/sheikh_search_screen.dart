import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../../core/widgets/person_card.dart';

// ignore: must_be_immutable
class SheikhSearchResults extends StatelessWidget {
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

  SheikhSearchResults({super.key});

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
        child: Container(
          padding: EdgeInsets.all(15),
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
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return PersonCard(onPressed: onPressed, person: person);
            },
          ),
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "student", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

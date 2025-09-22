import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../../core/widgets/persons_list.dart';

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
        padding:  EdgeInsets.all(16.r),
        child: PersonsList(persons: persons, onPressed: onPressed),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "student", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/widgets/progress_widget.dart';
import 'package:mutqin/features/student_features/logic/cubit/progress_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/progress_state.dart';
import 'package:mutqin/features/student_features/logic/cubit/sessions_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/sessions_state.dart';
import 'package:mutqin/features/student_features/ui/widgets/sheikh_search.dart';
import 'package:url_launcher/url_launcher.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("مرحبا بك", style: AppTextStyles.headline2),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SearchSheikhBar(),
            BlocBuilder<SessionsCubit, SessionsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(
                    child: Text(
                      'توجد مشكلة بالبدء',
                      style: AppTextStyles.headline2,
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.primery),
                  ),
                  success: (sessions) => SessionList(sessions: sessions),
                  fail: (error) => Center(
                    child: Text(error, style: AppTextStyles.headline2),
                  ),
                );
              },
            ),
            SizedBox(
              width: 383.w,
              child: ElevatedButton(
                onPressed: () => tasmee3("https://mahmoudgomaa8545-tasmee3-mutqin.hf.space/"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primery,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text("اختبر تسميعك", style: AppTextStyles.headline1),
              ),
            ),

            BlocBuilder<ProgressCubit, ProgressState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(
                    child: Text(
                      'توجد مشكلة بالبدء',
                      style: AppTextStyles.headline2,
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.primery),
                  ),
                  success: (lastProgress) =>
                      ProgressWidget(progress: lastProgress),
                  fail: (error) => Center(
                    child: Text(error, style: AppTextStyles.headline2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "STUDENT", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }

  Future<void> tasmee3(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'رابط التسميع يوجد به مشكلة ';
  }
}

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/string.dart';
import 'package:mutqin/core/widgets/progress_widget.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_student_progress_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_student_progress_state.dart';
import 'package:mutqin/features/sheikh_features/ui/widgets/sheikh_add_trophy.dart';
import 'package:mutqin/core/widgets/app_text_field.dart' show AppTextField;
import 'package:mutqin/features/student_features/data/models/progress_model.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/helper/shared_pref_helper.dart';
import '../../../core/widgets/floating_nav.dart';

class StudentProgress extends StatelessWidget {
  StudentProgress({super.key, required this.username});
   String username;

  @override
  Widget build(BuildContext context) {
    final TextEditingController sessions = TextEditingController();
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
        child: BlocConsumer<SheikhStudentProgressCubit, SheikhStudentProgressState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (msg) {
                if (msg is String) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        msg,
                        style: AppTextStyles.body1,
                        textAlign: TextAlign.end,
                      ),
                      backgroundColor: AppColors.darkprimery,
                    ),
                  );
                }
              },
              fail: (msg) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      msg,
                      style: AppTextStyles.body1,
                      textAlign: TextAlign.end,
                    ),
                    backgroundColor: AppColors.darkprimery,
                  ),
                );
              },
            );
          },
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
              success: (progresses) {
                if (progresses is List<ProgressModel> &&
                    progresses.isNotEmpty) {
                  final person = progresses.last;
                  return Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          person.user!.username!,
                          style: AppTextStyles.headline2.copyWith(
                            fontSize: 30.sp,
                            color: AppColors.primery,
                          ),
                          textAlign: TextAlign.end,
                        ),

                        SizedBox(height: 20.h),

                        ProgressWidget(progresses: progresses),
                        SizedBox(height: 20.h),

                        // SheikhAddTrophy(intialTrophies: trophies, onPressed: tryed),
                        //SizedBox(height: 20.h),
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
                        AppTextField(
                          controller: sessions,
                          hintText: AppStrings.add + AppStrings.session,
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            final cubit = context
                                .read<SheikhStudentProgressCubit>();

                            showDialog(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                backgroundColor: AppColors.secondary,
                                content: Text(
                                  "هل انت متأكد من ارسال التقرير بهذه القيم؟",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.body2,
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(dialogContext).pop(),
                                        child: Text(
                                          "لا",
                                          style: AppTextStyles.body2,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                          cubit.postProgress(
                                            username: person.user!.username!,
                                            pagesLearned: pages.text,
                                            numberOfSessionsAttended:
                                                sessions.text,
                                            points: points.text,
                                          );
                                          points.clear();
                                          sessions.clear();
                                          pages.clear();
                                        },
                                        child: Text(
                                          "نعم",
                                          style: AppTextStyles.body2,
                                        ),
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
                            side: BorderSide(
                              color: AppColors.darkprimery,
                              width: 1.w,
                            ),
                          ),
                          child: Text(
                            AppStrings.sendReport,
                            style: AppTextStyles.headline1,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 20.h),

                        // SheikhAddTrophy(intialTrophies: trophies, onPressed: tryed),
                        //SizedBox(height: 20.h),
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
                        AppTextField(
                          controller: sessions,
                          hintText: AppStrings.add + AppStrings.session,
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            final cubit = context
                                .read<SheikhStudentProgressCubit>();

                            showDialog(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                backgroundColor: AppColors.secondary,
                                content: Text(
                                  "هل انت متأكد من ارسال التقرير بهذه القيم؟",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.body2,
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(dialogContext).pop(),
                                        child: Text(
                                          "لا",
                                          style: AppTextStyles.body2,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                          cubit.postProgress(
                                            username: username,
                                            pagesLearned: pages.text,
                                            numberOfSessionsAttended:
                                                sessions.text,
                                            points: points.text,
                                          );
                                          points.clear();
                                          sessions.clear();
                                          pages.clear();
                                        },
                                        child: Text(
                                          "نعم",
                                          style: AppTextStyles.body2,
                                        ),
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
                            side: BorderSide(
                              color: AppColors.darkprimery,
                              width: 1.w,
                            ),
                          ),
                          child: Text(
                            AppStrings.sendReport,
                            style: AppTextStyles.headline1,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              fail: (error) =>
                  Center(child: Text(error, style: AppTextStyles.headline2)),
            );
          },
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "TUTOR", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

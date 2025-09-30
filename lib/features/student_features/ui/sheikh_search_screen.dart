import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/features/student_features/logic/cubit/book_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/book_state.dart';
import 'package:mutqin/features/student_features/logic/cubit/tutors_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/tutors_state.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../../core/widgets/persons_list.dart';

// ignore: must_be_immutable
class SheikhSearchResults extends StatelessWidget {
  SheikhSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("مرحبا بك ", style: AppTextStyles.headline2),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: BlocListener<BookCubit, BookState>(
        listener: (context, state) {
          state.whenOrNull(
            fail: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "هذا الشخص لم يضف رابط بعد",
                    style: AppTextStyles.body1,
                    textAlign: TextAlign.end,
                  ),
                  backgroundColor: AppColors.darkprimery,
                ),
              );
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: BlocBuilder<TutorsCubit, TutorsState>(
            builder: (context, tutorstate) {
              return tutorstate.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primery),
                ),
                success: (tutors) {
                  return PersonsList(
                    persons: tutors,
                    onPressed: (tutorId) {
                      context.read<BookCubit>().bookSession(tutorId);
                    },
                  );
                },
                fail: (msg) =>
                    Center(child: Text(msg, style: AppTextStyles.headline2)),
              );
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

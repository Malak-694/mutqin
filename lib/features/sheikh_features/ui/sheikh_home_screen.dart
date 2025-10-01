import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/string.dart';
import 'package:mutqin/core/router/route_names.dart';
import 'package:mutqin/core/widgets/app_text_field.dart';
import 'package:mutqin/core/widgets/persons_list.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/sheikh_calendy_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/sheikh_calendy_state.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_sessions_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_sessions_state.dart'
    hide Loading;
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_students_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_students_state.dart'
    hide Loading;

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../../core/widgets/session_list.dart';

class SheikhHomeScreen extends StatelessWidget {
  TextEditingController link = TextEditingController();

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
            BlocBuilder<SheikhSessionsCubit, SheikhSessionsState>(
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
                  success: (sessions) =>
                      SessionList(sessions: sessions, height: 320),
                  fail: (error) => Center(
                    child: Text(error, style: AppTextStyles.headline2),
                  ),
                );
              },
            ),
            BlocConsumer<SheikhCalendyCubit, SheikhCalendyState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (msg) {
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
                return Row(
                  children: [
                    state is Loading
                        ? const CircularProgressIndicator(
                            color: AppColors.primery,
                          )
                        : IconButton(
                            onPressed: () {
                              context.read<SheikhCalendyCubit>().postCalendy(
                                link.text,
                              );
                              link.clear();
                            },
                            icon: Icon(
                              Icons.send,
                              color: AppColors.lightprimery,
                            ),
                          ),
                    AppTextField(
                      width: 300,
                      controller: link,
                      hintText: AppStrings.addCalendyLink,
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<SheikhStudentsCubit, SheikhStudentsState>(
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
                  success: (persons) {
                    return PersonsList(
                      student: false,
                      persons: persons,
                      onPressed: (username) {
                        Navigator.pushNamed(
                          context,
                          RouteNames.studentProgress,
                          arguments: username,
                        );
                      },
                      height: 325,
                    );
                  },
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
        userRole: "teacher", // Example role
        selectedIndex: 0, // Profile index
      ),
    );
  }
}

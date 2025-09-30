import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';
import 'package:mutqin/core/constants/app_assets.dart';
import 'package:mutqin/core/constants/string.dart';
import 'package:mutqin/core/constants/text.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/core/utils/validator.dart';
import 'package:mutqin/core/widgets/floating_nav.dart';
import 'package:mutqin/features/auth/ui/widgets/text_field.dart';
import 'package:mutqin/features/profile/logic/cubit/profile_cubit.dart';
import 'package:mutqin/features/profile/logic/cubit/profile_state.dart';
import 'package:mutqin/features/profile/ui/widgets/end_button.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/router/route_names.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final prefs = getIt<SharedPrefHelper>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final roleController = TextEditingController();
    final ageController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            fail: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    msg,
                    style: AppTextStyles.body1,
                    textAlign: TextAlign.end,
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primery),
            );
          }

          if (state is Success) {
            final user = cubit.user;
            if (user != null) {
              usernameController.text = user.username ?? "";
              ageController.text = user.age ?? "";
              emailController.text = user.email ?? "";
              phoneController.text = user.phone ?? "";
              roleController.text = user.role ?? "";
            }
          }

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 80.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 250.h,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.lightprimery,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -70.h,
                      child: Image.asset(
                        AppAssets.logo,
                        width: 100.w,
                        height: 100.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          CustomTextField(
                            controller: usernameController,
                            label: AppStrings.username,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: ageController,
                            label: AppStrings.age,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: emailController,
                            label: AppStrings.email,
                            validator: Validators.validateEmail,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: phoneController,
                            label: AppStrings.phone,
                            validator: Validators.validatePhone,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: roleController,
                            label: AppStrings.role,
                            editable: false,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              EndButton(
                                text: AppStrings.removeProfile,
                                color: const Color.fromARGB(255, 255, 151, 144),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: AppColors.secondary,
                                      content: Text(
                                        "هل انت متأكد من مسح الحساب ",
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
                                                  Navigator.of(context).pop(),
                                              child: Text(
                                                "لا",
                                                style: AppTextStyles.body2,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  RouteNames.register,
                                                );
                                                cubit.deleteProfile();
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
                              ),
                              EndButton(
                                color: const Color.fromARGB(255, 155, 229, 175),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: AppColors.secondary,
                                      content: Text(
                                        "هل انت متأكد من تعديل البيانات ",
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
                                                  Navigator.of(context).pop(),
                                              child: Text(
                                                "لا",
                                                style: AppTextStyles.body2,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                cubit.updateProfile(
                                                  age: ageController.text,
                                                  username:
                                                      usernameController.text,
                                                  phone: phoneController.text,
                                                );
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
                                text: AppStrings.confirmChange,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: prefs.getData(SharedPrefKey.role),
        selectedIndex: 2,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';
import 'package:mutqin/features/profile/ui/widgets/end_button.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/string.dart';
import '../../../core/constants/text.dart';
import '../../../core/utils/validator.dart';
import '../../../core/widgets/floating_nav.dart';
import '../../auth/ui/widgets/text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Add form key
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 80.h),
          child: Form(
            // Wrap with Form widget
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    250.h, // Minimum height
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

                          value: "malak_694",
                        ),
                        SizedBox(height: 20.h),

                        CustomTextField(
                          controller: nameController,
                          label: AppStrings.name,
                          value: "ملك احمد محمد",
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: emailController,
                          label: AppStrings.email,

                          validator: Validators.validateEmail,
                          value: "malak@gmail.com",
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: phoneController,
                          label: AppStrings.phone,
                          validator: Validators.validatePhone,
                          value: "0100264862146",
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: TextEditingController(),
                          label: AppStrings.role,
                          editable: false,
                          value: "طالب",
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
                                              Navigator.of(context).pop();
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
                              onPressed: () {},
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
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "student", // Example role
        selectedIndex: 3, // Profile index
      ),
    );
  }
}

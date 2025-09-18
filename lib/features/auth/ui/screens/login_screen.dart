import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';
import 'package:mutqin/core/constants/text.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mutqin/features/auth/ui/widgets/select_user.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/string.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_google.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Add form key
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // Call the register method from AuthCubit
      context.read<AuthCubit>().login(
        emailController.text.trim(),
        passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message, style: AppTextStyles.headline1),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate to next screen on success
            // Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error, style: AppTextStyles.headline1),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 100.h),
          child: Form(
            // Wrap with Form widget
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    100.h, // Minimum height
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
                        SizedBox(height: 80.h),

                        Text(
                          AppStrings.loginGoogle,
                          style: AppTextStyles.body1,
                        ),
                        SizedBox(height: 30.h),
                        SignGoogleButton(),
                        SizedBox(height: 30.h),
                        Text(AppStrings.loginEmail, style: AppTextStyles.body1),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: emailController,
                          label: AppStrings.email,
                          validator: Validators.validateEmail,
                        ),
                        SizedBox(height: 20.h),

                        CustomTextField(
                          controller: passwordController,
                          label: AppStrings.password,
                          validator: Validators.validatePassword,
                          isPassword: true,
                        ),
                        SizedBox(height: 40.h),

                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return SignButton(
                              text: AppStrings.loginButton,
                              onPressed: _handleSignUp,
                              isLoading: state is AuthLoading,
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RouteNames.register,
                                );
                              },
                              child: Text(
                                AppStrings.registerButton,
                                style: AppTextStyles.button.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.background,
                                ),
                              ),
                            ),
                            Text(
                              AppStrings.dontHaveAccount,
                              style: AppTextStyles.body1,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';
import 'package:mutqin/core/constants/text.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mutqin/features/auth/ui/widgets/select_user.dart';

import '../../../../core/constants/string.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_google.dart';
import '../widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedUserType = 'طالب/ة';
  final _formKey = GlobalKey<FormState>(); // Add form key
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // Call the register method from AuthCubit
      context.read<AuthCubit>().register(
        emailController.text.trim(),
        passwordController.text,
        phoneController.text.trim(),
        confirmPasswordController.text,
        _selectedUserType,
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
              height: MediaQuery.of(context).size.height - 100.h,
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
                      'assets/images/logo.png',
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 10.h),
                        UserTypeSelector(
                          selectedUserType: _selectedUserType,
                          onUserTypeChanged: (newType) {
                            setState(() {
                              _selectedUserType = newType;
                            });
                          },
                        ),
                        Text(
                          AppStrings.registerGoogle,
                          style: AppTextStyles.body1,
                        ),
                        SignGoogleButton(),
                        Text(
                          AppStrings.registerEmail,
                          style: AppTextStyles.body1,
                        ),
                        CustomTextField(
                          controller: emailController,
                          label: AppStrings.email,
                          validator: Validators.validateEmail,
                        ),
                        CustomTextField(
                          controller: phoneController,
                          label: AppStrings.phone,
                          validator: Validators.validatePhone,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          label: AppStrings.password,
                          validator: Validators.validatePassword,
                          isPassword: true,
                        ),
                        CustomTextField(
                          controller: confirmPasswordController,
                          label: AppStrings.confirmPassword,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                                value,
                                passwordController.text,
                              ),
                          isPassword: true,
                        ),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return SignButton(
                              text: AppStrings.registerButton,
                              onPressed: _handleSignUp,
                              isLoading: state is AuthLoading,
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RouteNames.login,
                                );
                              },
                              child: Text(
                                AppStrings.loginButton,
                                style: AppTextStyles.button.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.background,
                                ),
                              ),
                            ),
                            Text(
                              AppStrings.alreadyHaveAccount,
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

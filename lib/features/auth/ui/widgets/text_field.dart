import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/text.dart';
import '../../../../core/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // default hide password

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(widget.label, style: AppTextStyles.headline1),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 37.h,
          width: 350.w,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              prefixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primery,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: BorderSide(color: AppColors.secondary, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkprimery, width: 1),
                borderRadius: BorderRadius.circular(13.r),
              ),
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}

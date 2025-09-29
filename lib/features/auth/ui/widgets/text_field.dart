import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/text.dart';
import '../../../../core/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool editable;
  final String? value;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.editable = true,
    this.value,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // default hide password
  @override
  void initState() {
    super.initState();
    // If value is passed and controller is empty, set it as default text
    if (widget.value != null && widget.controller.text.isEmpty) {
      widget.controller.text = widget.value!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            widget.label,
            style: AppTextStyles.body1.copyWith(fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 37.h,
          width: 350.w,
          child: TextFormField(
            enabled: widget.editable,

            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            textAlign: TextAlign.end,
            style: AppTextStyles.body1.copyWith(fontSize: 16.sp),
            decoration: InputDecoration(
              isDense: true, // reduces default vertical padding
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w,
              ),
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

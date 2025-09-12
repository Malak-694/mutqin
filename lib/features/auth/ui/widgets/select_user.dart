// user_type_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/text.dart';

import '../../../../core/constants/colors.dart';

class UserTypeSelector extends StatefulWidget {
  final String selectedUserType;
  final Function(String) onUserTypeChanged;
  final List<String> userTypes;

  const UserTypeSelector({
    Key? key,
    required this.selectedUserType,
    required this.onUserTypeChanged,
    this.userTypes = const ['طالب/ة', 'ولي أمر', 'معلم/ة'],
  }) : super(key: key);

  @override
  State<UserTypeSelector> createState() => _UserTypeSelectorState();
}

class _UserTypeSelectorState extends State<UserTypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.userTypes
          .map((type) => _buildUserTypeOption(type))
          .toList(),
    );
  }

  Widget _buildUserTypeOption(String type) {
    bool isSelected = widget.selectedUserType == type;
    return GestureDetector(
      onTap: () {
        // Call the callback function to notify parent
        widget.onUserTypeChanged(type);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(type, style: AppTextStyles.body1),
          const SizedBox(width: 8),

          Container(
            width: 16.w,
            height: 16.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.darkprimery, width: 1.w),
            ),
            child: Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.darkprimery
                    : AppColors.background,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

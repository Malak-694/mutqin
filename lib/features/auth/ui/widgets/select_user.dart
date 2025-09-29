// user_type_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/text.dart';
import '../../../../core/constants/colors.dart';

class UserTypeSelector extends StatefulWidget {
  final String selectedUserType; // e.g. "student" or "teacher"
  final Function(String) onUserTypeChanged;
  final Map<String, String> userTypes;

  const UserTypeSelector({
    Key? key,
    required this.selectedUserType,
    required this.onUserTypeChanged,
    this.userTypes = const {'STUDENT': 'طالب/ة', 'TUTOR': 'مدرس/ة'},
  }) : super(key: key);

  @override
  State<UserTypeSelector> createState() => _UserTypeSelectorState();
}

class _UserTypeSelectorState extends State<UserTypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.userTypes.entries
          .map((entry) => _buildUserTypeOption(entry.key, entry.value))
          .toList(),
    );
  }

  Widget _buildUserTypeOption(String key, String label) {
    bool isSelected = widget.selectedUserType == key;

    return GestureDetector(
      onTap: () {
        widget.onUserTypeChanged(key);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: AppTextStyles.body1), // Arabic label for UI
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

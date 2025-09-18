import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text.dart';

class EndButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  const EndButton({super.key, required this.color, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyles.headline1),
    );
  }
}

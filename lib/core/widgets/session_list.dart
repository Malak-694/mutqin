import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/features/student_features/data/models/session_model.dart';

import 'session_card.dart';
import '../constants/colors.dart';

class SessionList extends StatelessWidget {
  const SessionList({super.key, required this.sessions, this.height = 270});

  final List<SessionModel> sessions;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //Todo: search parameters
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          height: height.h,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(26.r),
            border: Border.all(color: AppColors.primery, width: 1.w),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  155,
                  209,
                  200,
                  178,
                ).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SessionCard(sessions: sessions),
        ),
      ],
    );
  }
}

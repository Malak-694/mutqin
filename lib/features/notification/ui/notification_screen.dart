import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/widgets/floating_nav.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {"content": "مرحبا بك يا محمد لقد سجلنا حسابك"},
    {"content": "لا تنسى حضور الجلسة يوم الخميس"},
    {"content": "لقد قمنا بارسال تقرير الى والدك "},
    {"content": "نتمنى ان تكون قد راجعت قبل حفظك"},
    {"content": "الحمد لله/ الله اكبر"},
    {"content": "مرحبا بك يا محمد لقد سجلنا حسابك"},
    {"content": "لا تنسى حضور الجلسة يوم الخميس"},
    {"content": "لقد قمنا بارسال تقرير الى والدك "},
    {"content": "نتمنى ان تكون قد راجعت قبل حفظك"},
    {"content": "الحمد لله/ الله اكبر"},
    {"content": "الحمد لله/ الله اكبر"},
    {"content": "مرحبا بك يا محمد لقد سجلنا حسابك"},
    {"content": "لا تنسى حضور الجلسة يوم الخميس"},
    {"content": "لقد قمنا بارسال تقرير الى والدك "},
    {"content": "نتمنى ان تكون قد راجعت قبل حفظك"},
    {"content": "الحمد لله/ الله اكبر"},
    {"content": "الحمد لله/ الله اكبر"},
    {"content": "مرحبا بك يا محمد لقد سجلنا حسابك"},
    {"content": "لا تنسى حضور الجلسة يوم الخميس"},
    {"content": "لقد قمنا بارسال تقرير الى والدك "},
    {"content": "نتمنى ان تكون قد راجعت قبل حفظك"},
    {"content": "الحمد لله/ الله اكبر"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("مرحبا بك يا أحمد", style: AppTextStyles.headline2),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              constraints: BoxConstraints(
                minHeight: 61, // Minimum height
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.primery, width: 1.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      notification["content"]!,
                      style: AppTextStyles.headline2.copyWith(),
                      textAlign: TextAlign.right,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Icon(
                    Icons.notifications,
                    size: 40.h,
                    color: AppColors.primery,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        userRole: "student", // Example role
        selectedIndex: 1, // Profile index
      ),
    );
  }
}

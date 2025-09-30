import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/features/notification/logic/cubit/notification_cubit.dart';
import 'package:mutqin/features/notification/logic/cubit/notification_state.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/widgets/floating_nav.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool showUnread = true; // false = all, true = unread
  final prefs = getIt<SharedPrefHelper>();

  @override
  void initState() {
    super.initState();
    // load initial data
    context.read<NotificationCubit>().getNotificationAll();
  }

  void _toggleView(bool unread) {
    setState(() => showUnread = unread);
    if (unread) {
      context.read<NotificationCubit>().getNotificationUnread();
    } else {
      context.read<NotificationCubit>().getNotificationAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("الإشعارات", style: AppTextStyles.headline2),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: Column(
        children: [
          // 🔹 Toggle Buttons
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text("الكل", style: AppTextStyles.body1),
                  selected: !showUnread,
                  onSelected: (_) => _toggleView(false),
                  selectedColor: AppColors.primery, // when selected
                  backgroundColor: AppColors.lightprimery,
                ),
                SizedBox(width: 12.w),
                ChoiceChip(
                  label: Text("غير مقروء", style: AppTextStyles.body1),
                  selected: showUnread,
                  onSelected: (_) => _toggleView(true),
                  selectedColor: AppColors.primery, // when selected
                  backgroundColor: AppColors.lightprimery,
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(
                      child: Text(
                        "لا يوجد إشعارات حالياً",
                        style: AppTextStyles.body2,
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primery,
                      ),
                    ),
                    success: (notifications) {
                      if (notifications.isEmpty) {
                        return Center(
                          child: Text(
                            showUnread
                                ? "لا يوجد إشعارات غير مقروءة"
                                : "لا يوجد إشعارات",
                            style: AppTextStyles.body2,
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 12.h),
                            constraints: const BoxConstraints(minHeight: 61),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: AppColors.primery,
                                width: 1.w,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    notification.message ?? "",
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
                      );
                    },
                    fail: (message) => Center(child: Text(message)),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: FloatingNavBar(
        userRole: prefs.getData(SharedPrefKey.role),
        selectedIndex: 1,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqin/core/constants/colors.dart';
import 'package:mutqin/core/router/route_names.dart';

class FloatingNavBar extends StatelessWidget {
  final String userRole;
  final int selectedIndex;

  const FloatingNavBar({
    super.key,
    required this.userRole,
    required this.selectedIndex,
  });

  Map<String, List<Map<String, dynamic>>> get roleNavItems => {
    "STUDENT": [
      {"icon": Icons.home, "route": RouteNames.studentHome},
      {"icon": Icons.notifications, "route": RouteNames.notification},
      {"icon": Icons.person, "route": RouteNames.profile},
    ],
    "TUTOR": [
      {"icon": Icons.home, "route": RouteNames.sheikhHome},
      {"icon": Icons.notifications, "route": RouteNames.notification},
      
      {"icon": Icons.person, "route": RouteNames.profile},
    ],
    "admin": [
      {"icon": Icons.home, "route": RouteNames.login},
      {"icon": Icons.notifications, "route": RouteNames.login},
      {"icon": Icons.person, "route": RouteNames.login},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final navItems = roleNavItems[userRole] ?? roleNavItems["STUDENT"]!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 63.h,
        width: 380.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: BottomAppBar(
            color: AppColors.lightsecondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navItems.length, (index) {
                final item = navItems[index];
                final bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    if (ModalRoute.of(context)?.settings.name !=
                        item["route"]) {
                      Navigator.pushNamed(context, item["route"]);
                    }
                  },
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: isSelected ? 1.0 : 0.8,
                      end: isSelected ? 1.2 : 0.9,
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutBack,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Icon(
                          item["icon"],
                          color: isSelected
                              ? AppColors.primery
                              : AppColors.lightprimery,
                          size: isSelected ? 36.r : 28.r,
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

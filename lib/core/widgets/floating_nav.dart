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

  // Define role-based nav items (icons + routes)
  Map<String, List<Map<String, dynamic>>> get roleNavItems => {
    "student": [
      {"icon": Icons.home, "route": RouteNames.login},
      {"icon": Icons.notifications, "route": RouteNames.notification},
      {"icon": Icons.bar_chart, "route": RouteNames.login},
      {"icon": Icons.person, "route": RouteNames.profile},
    ],
    "teacher": [
      {"icon": Icons.home, "route": RouteNames.login},
      {"icon": Icons.notifications, "route": RouteNames.login},
      {"icon": Icons.school, "route": RouteNames.login},
      {"icon": Icons.person, "route": RouteNames.login},
    ],
    "admin": [
      {"icon": Icons.home, "route": RouteNames.login},
      {"icon": Icons.notifications, "route": RouteNames.login},
      {"icon": Icons.person, "route": RouteNames.login},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final navItems = roleNavItems[userRole] ?? roleNavItems["student"]!;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(navItems.length, (index) {
                final item = navItems[index];
                return IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    item["icon"],
                    color: selectedIndex == index
                        ? AppColors.primery
                        : AppColors.lightsecondary,
                    shadows: [
                      Shadow(
                        blurRadius: 0,
                        color: AppColors.primery,
                        offset: Offset(1, 1),
                      ),
                      Shadow(
                        blurRadius: 0,
                        color: AppColors.primery,
                        offset: Offset(-1, 1),
                      ),
                      Shadow(
                        blurRadius: 0,
                        color: AppColors.primery,
                        offset: Offset(1, -1),
                      ),
                      Shadow(
                        blurRadius: 0,
                        color: AppColors.primery,
                        offset: Offset(-1, -1),
                      ),
                    ],
                    size: 42.r,
                  ),
                  onPressed: () {
                    if (ModalRoute.of(context)?.settings.name !=
                        item["route"]) {
                      Navigator.pushNamed(context, item["route"]);
                    }
                  },
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

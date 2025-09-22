import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutqin/core/router/route_names.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mutqin/features/auth/ui/screens/login_screen.dart';
import 'package:mutqin/features/auth/ui/screens/signup_screen.dart';
import 'package:mutqin/features/notification/ui/notification_screen.dart';
import 'package:mutqin/features/profile/ui/profile.dart';
import 'package:mutqin/features/sheikh_features/ui/sheikh_home_screen.dart';
import 'package:mutqin/features/sheikh_features/ui/student_progress_screen.dart';
import 'package:mutqin/features/student_features.dart/ui/sheikh_search_screen.dart';

import '../../features/admin_features/admin_screen.dart';
import '../../features/parent_features/parent_home_screen.dart';
import '../../features/parent_features/son_report_screen.dart';
import '../../features/sheikh_features/ui/trophy_screen.dart';
import '../../features/student_features.dart/ui/student_homeScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(), child: LoginScreen()),
        );
      case RouteNames.register:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(), child: SignUpScreen()),
        );
      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteNames.notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case RouteNames.studentHome:
        return MaterialPageRoute(builder: (_) => StudentHomescreen());
      case RouteNames.sheikhSearchResults:
        return MaterialPageRoute(builder: (_) => SheikhSearchResults());
      case RouteNames.sheikhHome:
        return MaterialPageRoute(builder: (_) => SheikhHomeScreen());
      case RouteNames.studentProgress:
        return MaterialPageRoute(builder: (_) => StudentProgress());
      case RouteNames.trophy:
        return MaterialPageRoute(builder: (_) => TrophyScreen());
      case RouteNames.parentHome:
        return MaterialPageRoute(builder: (_) => ParentHome());
      case RouteNames.sonReport:
        return MaterialPageRoute(builder: (_) => SonReportScreen());
      case RouteNames.adminScreen:
        return MaterialPageRoute(builder: (_) => AdminScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutqin/core/di/dependency_injection.dart';
import 'package:mutqin/core/router/route_names.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mutqin/features/auth/ui/screens/login_screen.dart';
import 'package:mutqin/features/auth/ui/screens/signup_screen.dart';
import 'package:mutqin/features/notification/logic/cubit/notification_cubit.dart';
import 'package:mutqin/features/notification/ui/notification_screen.dart';
import 'package:mutqin/features/profile/logic/cubit/profile_cubit.dart';
import 'package:mutqin/features/profile/ui/profile_screen.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/sheikh_calendy_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_sessions_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_student_progress_cubit.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_students_cubit.dart';
import 'package:mutqin/features/sheikh_features/ui/sheikh_home_screen.dart';
import 'package:mutqin/features/sheikh_features/ui/student_progress_screen.dart';
import 'package:mutqin/features/student_features/logic/cubit/book_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/progress_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/sessions_cubit.dart';
import 'package:mutqin/features/student_features/logic/cubit/tutors_cubit.dart';
import 'package:mutqin/features/student_features/ui/sheikh_search_screen.dart';

import '../../features/admin_features/admin_screen.dart';
import '../../features/parent_features/parent_home_screen.dart';
import '../../features/parent_features/son_report_screen.dart';
import '../../features/sheikh_features/ui/trophy_screen.dart';
import '../../features/student_features/ui/student_homeScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(getIt()),
            child: LoginScreen(),
          ),
        );
      case RouteNames.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(getIt()),
            child: SignUpScreen(),
          ),
        );
      case RouteNames.profile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => ProfileCubit(getIt()),
            child: ProfileScreen(),
          ),
        );
      case RouteNames.notification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NotificationCubit(getIt()),
            child: NotificationScreen(),
          ),
        );
      case RouteNames.studentHome:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<ProgressCubit>(
                create: (context) => ProgressCubit(getIt()),
              ),
              BlocProvider<SessionsCubit>(
                create: (context) => SessionsCubit(getIt()),
              ),
            ],
            child: StudentHomescreen(),
          ),
        );
      case RouteNames.sheikhSearchResults:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<TutorsCubit>(
                create: (context) => TutorsCubit(getIt()),
              ),
              BlocProvider<BookCubit>(create: (context) => BookCubit(getIt())),
            ],
            child: SheikhSearchResults(),
          ),
        );
      case RouteNames.sheikhHome:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SheikhCalendyCubit>(
                create: (context) => SheikhCalendyCubit(getIt()),
              ),
              BlocProvider<SheikhSessionsCubit>(
                create: (context) => SheikhSessionsCubit(getIt()),
              ),
              BlocProvider<SheikhStudentsCubit>(
                create: (context) => SheikhStudentsCubit(getIt()),
              ),
            ],
            child: SheikhHomeScreen(),
          ),
        );
      case RouteNames.studentProgress:
        final String username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SheikhStudentProgressCubit(getIt())..getProgress(username),
            child: StudentProgress(username: username),
          ),
        );

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

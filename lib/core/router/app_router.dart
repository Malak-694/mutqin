import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutqin/core/router/route_names.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_cubit.dart';
import 'package:mutqin/features/auth/ui/screens/login_screen.dart';
import 'package:mutqin/features/auth/ui/screens/signup_screen.dart';
import 'package:mutqin/features/notification/ui/notification_screen.dart';
import 'package:mutqin/features/profile/ui/profile.dart';

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
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}

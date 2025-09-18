import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';

void main() {
  runApp(const MutqinApp());
}

class MutqinApp extends StatelessWidget {
  const MutqinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917), // iPhone X size (adjust as needed)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Mutqin',
          initialRoute: RouteNames.profile,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}

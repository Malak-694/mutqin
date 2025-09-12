import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';

void main() {
  runApp(const MutqinApp());
}

class MutqinApp extends StatelessWidget {
  const MutqinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mutqin',
      initialRoute: RouteNames.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

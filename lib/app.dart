import 'package:flutter/material.dart';
import 'routes/app_router.dart';

class DailyChaosApp extends StatelessWidget {
  const DailyChaosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Daily Chaos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}

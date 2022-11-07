import 'package:flutter/material.dart';

import 'package:tageneration/ui/navigation/main_navigation.dart';
import 'package:tageneration/ui/theme/theme.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tageneration',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dartTheme,
      darkTheme: AppTheme.dartTheme,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      initialRoute: MainNavigationRouteNames.loaderScreen,
    );
  }
}

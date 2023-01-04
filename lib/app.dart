import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routers/router.dart';
import 'theme/presentation/utils/theme_util.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = getRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quotify',
      theme: getLightThemeData(),
      darkTheme: getDarkThemeData(),
      themeMode: getThemeMode(context),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}

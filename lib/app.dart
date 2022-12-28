import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routers/router.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = getRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}

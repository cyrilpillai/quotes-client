import 'package:flutter/material.dart';
import 'package:quotes/list/presentation/screens/quote_list_screen.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuoteListScreen(),
    );
  }
}

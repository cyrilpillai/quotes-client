import 'package:flutter/material.dart';

import 'app.dart';
import 'di/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const QuoteApp());
}

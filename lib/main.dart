import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'di/setup.dart';
import 'theme/presentation/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (BuildContext context) => injector<ThemeCubit>(),
      ),
    ],
    child: const QuoteApp(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: false);
    return IconButton(
      icon: Icon(
        themeCubit.isDark ? Icons.light_mode : Icons.dark_mode,
      ),
      onPressed: () {
        themeCubit.toggleTheme();
      },
    );
  }
}

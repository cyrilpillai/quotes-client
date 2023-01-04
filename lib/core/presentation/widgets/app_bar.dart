import 'package:flutter/material.dart';

import '../../../theme/presentation/widgets/theme_button.dart';

AppBar getAppBar({
  final String? title,
  final Widget? leading,
  final List<Widget>? actions,
  final bool showThemeChanger = false,
}) {
  final List<Widget> actionsList = [...actions ?? []];
  if (showThemeChanger) {
    actionsList.add(const ThemeButton());
  }
  return AppBar(
    title: Text(title ?? 'Quotify'),
    centerTitle: false,
    leading: leading,
    actions: actionsList,
  );
}

import 'package:flutter/material.dart';

/* We can't show SnackBar in build methods, addPostFrameCallback ensures
  that the SnackBar is shown immediately after the widgets are built.
  */
void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  WidgetsBinding.instance.addPostFrameCallback(
      (_) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
}

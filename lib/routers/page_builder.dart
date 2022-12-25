import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page createPage(GoRouterState state, Widget child) {
  return MaterialPage(
    key: state.pageKey,
    maintainState: false,
    child: child,
  );
}

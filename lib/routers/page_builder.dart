import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page createPage(GoRouterState state, Widget child,
    {PageAnimation pageAnimation = PageAnimation.generic}) {
  switch (pageAnimation) {
    case PageAnimation.fade:
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        maintainState: false,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      );
    default:
      return MaterialPage(
        key: state.pageKey,
        maintainState: false,
        child: child,
      );
  }
}

enum PageAnimation {
  fade,
  generic,
}

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../routers/chart_page_route.dart';
import '../../../routers/leaderboard_page_route.dart';
import '../../../routers/list_page_route.dart';
import '../../../routers/random_quote_page_route.dart';
import '../models/navigation_bar_item.dart';

class AppScaffoldPage extends StatefulWidget {
  const AppScaffoldPage({super.key, required this.child});

  final Widget child;

  @override
  State<AppScaffoldPage> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        color: theme.primaryColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: _getBottomPadding(),
          ),
          child: GNav(
            tabs: _getNavigationBarItems(),
            selectedIndex: _getCurrentNavigationBarItemIndex(context),
            onTabChange: _onTap,
            backgroundColor: theme.primaryColor,
            color: theme.primaryIconTheme.color,
            activeColor: theme.primaryIconTheme.color,
            tabBackgroundColor: theme.primaryColorDark,
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            gap: 8.0,
          ),
        ),
      ),
    );
  }

  double _getBottomPadding() {
    if (!kIsWeb && Platform.isIOS) {
      return 32.0;
    } else {
      return 16.0;
    }
  }

  List<GButton> _getNavigationBarItems() {
    return const [
      GButton(text: 'Home', icon: Icons.home_outlined),
      GButton(text: 'Chart', icon: Icons.pie_chart_outline),
      GButton(text: 'Leaderboard', icon: Icons.leaderboard_outlined),
      GButton(text: 'Random', icon: Icons.shuffle_rounded),
    ];
  }

  int _getCurrentNavigationBarItemIndex(BuildContext context) {
    return _getCurrentNavigationBarItem(context).indexValue;
  }

  NavigationBarItem _getCurrentNavigationBarItem(BuildContext context) {
    final String location = GoRouter.of(context).location;
    if (location.startsWith(chartRoute)) {
      return NavigationBarItem.chart;
    } else if (location.startsWith(leaderboardRoute)) {
      return NavigationBarItem.leaderboard;
    } else if (location.startsWith(randomRoute)) {
      return NavigationBarItem.random;
    } else {
      return NavigationBarItem.list;
    }
  }

  void _onTap(int indexValue) {
    switch (NavigationBarItem.fromIndexValue(indexValue)) {
      case NavigationBarItem.chart:
        return context.go(chartRoute);
      case NavigationBarItem.leaderboard:
        return context.go(leaderboardRoute);
      case NavigationBarItem.random:
        return context.go(randomRoute);
      default:
        return context.go(listRoute);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../routers/chart_page_route.dart';
import '../../routers/leaderboard_page_route.dart';
import '../../routers/list_page_route.dart';
import '../../routers/random_quote_page_route.dart';

class AppScaffoldPage extends StatefulWidget {
  const AppScaffoldPage({super.key, required this.child});

  final Widget child;

  @override
  State<AppScaffoldPage> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: GNav(
            tabs: _getNavigationBarItems(),
            selectedIndex: _calculateSelectedIndex(context),
            onTabChange: _onTap,
            backgroundColor: Colors.blueGrey,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blueGrey.shade800,
            iconSize: 18.0,
            textSize: 14.0,
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

  List<GButton> _getNavigationBarItems() {
    return const [
      GButton(text: 'Home', icon: Icons.home_outlined),
      GButton(text: 'Chart', icon: Icons.pie_chart_outline),
      GButton(text: 'Leaderboard', icon: Icons.leaderboard_outlined),
      GButton(text: 'Random', icon: Icons.shuffle_rounded),
    ];
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouter.of(context).location;
    if (location.startsWith(chartRoute)) {
      return 1;
    } else if (location.startsWith(leaderboardRoute)) {
      return 2;
    } else if (location.startsWith(randomRoute)) {
      return 3;
    } else {
      return 0;
    }
  }

  void _onTap(int value) {
    switch (value) {
      case 1:
        return context.go(chartRoute);
      case 2:
        return context.go(leaderboardRoute);
      case 3:
        return context.go(randomRoute);
      default:
        return context.go(listRoute);
    }
  }
}

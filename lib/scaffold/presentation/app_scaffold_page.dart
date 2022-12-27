import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: _getNavigationBarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart),
        label: 'Chart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.leaderboard),
        label: 'Leaderboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shuffle_on_rounded),
        label: 'Random',
      ),
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

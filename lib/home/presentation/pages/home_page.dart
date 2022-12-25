import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/add_page_route.dart';
import '../../../routers/chart_page_route.dart';
import '../../../routers/leaderboard_page_route.dart';
import '../../../routers/list_page_route.dart';
import '../../../routers/random_quote_page_route.dart';
import '../widgets/home_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotify'),
      ),
      body: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        HomeButton(
          title: 'Quotes',
          icon: Icons.list_alt,
          onPressed: () => context.pushNamed(listRoute),
        ),
        HomeButton(
          title: 'Add Quote',
          icon: Icons.add_circle,
          onPressed: () => context.pushNamed(addRoute),
        ),
        HomeButton(
          title: 'Chart',
          icon: Icons.pie_chart,
          onPressed: () => context.pushNamed(chartRoute),
        ),
        HomeButton(
          title: 'Leaderboard',
          icon: Icons.leaderboard,
          onPressed: () => context.pushNamed(leaderboardRoute),
        ),
        HomeButton(
          title: 'Random',
          icon: Icons.shuffle_on_outlined,
          onPressed: () => context.pushNamed(randomRoute),
        ),
      ],
    );
  }
}

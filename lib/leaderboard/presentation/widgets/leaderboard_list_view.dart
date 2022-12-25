import 'package:flutter/material.dart';

import '../models/leaderboard_item.dart';
import 'leaderboard_card.dart';

class LeaderboardListView extends StatelessWidget {
  final List<LeaderboardItem> leaderboardItems;

  const LeaderboardListView({
    super.key,
    required this.leaderboardItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      itemCount: leaderboardItems.length,
      itemBuilder: (_, index) => LeaderboardCard(
        leaderboardItem: leaderboardItems[index],
      ),
    );
  }
}

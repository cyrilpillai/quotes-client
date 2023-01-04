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
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      itemCount: leaderboardItems.length,
      itemBuilder: (_, index) => LeaderboardCard(
        leaderboardItem: leaderboardItems[index],
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
        );
      },
    );
  }
}

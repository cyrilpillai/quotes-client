import 'package:flutter/material.dart';
import 'package:quotes/leaderboard/presentation/models/leaderboard_item.dart';

class LeaderboardCard extends StatelessWidget {
  final LeaderboardItem leaderboardItem;

  const LeaderboardCard({super.key, required this.leaderboardItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: leaderboardItem.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Text(
              leaderboardItem.rank,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
            Expanded(
              child: Text(
                leaderboardItem.author,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
            Text(
              leaderboardItem.count,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

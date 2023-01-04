import 'package:flutter/material.dart';

import '../models/leaderboard_item.dart';

class LeaderboardCard extends StatelessWidget {
  final LeaderboardItem leaderboardItem;

  const LeaderboardCard({super.key, required this.leaderboardItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            _getMedal(leaderboardItem.medalColor),
            _getRank(leaderboardItem.rank, leaderboardItem.medalColor),
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
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMedal(Color? color) {
    if (color != null) {
      return Icon(
        Icons.workspace_premium,
        color: color,
      );
    } else {
      return Container();
    }
  }

  Widget _getRank(String rank, Color? color) {
    if (color == null) {
      return Text(
        leaderboardItem.rank,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Container();
    }
  }
}

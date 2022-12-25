import 'package:flutter/material.dart';

import '../../domain/entities/leaderboard_entity.dart';

class LeaderboardItem {
  final String rank;
  final String author;
  final String count;
  final Color color;

  const LeaderboardItem({
    required this.rank,
    required this.author,
    required this.count,
    required this.color,
  });

  factory LeaderboardItem.fromEntity(LeaderboardEntity entity) {
    return LeaderboardItem(
      rank: entity.rank.toString(),
      author: entity.author,
      count: entity.count.toString(),
      color: _leaderboardColor(entity.rank),
    );
  }
}

Color _leaderboardColor(int rank) {
  switch (rank) {
    case 1:
      return Colors.amber;
    case 2:
      return Colors.grey;
    case 3:
      return Colors.brown;
    default:
      return Colors.white;
  }
}

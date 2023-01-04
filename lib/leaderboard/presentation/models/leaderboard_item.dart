import 'package:flutter/material.dart';

import '../../domain/entities/leaderboard_entity.dart';

class LeaderboardItem {
  final String rank;
  final String author;
  final String count;
  final Color? medalColor;

  const LeaderboardItem({
    required this.rank,
    required this.author,
    required this.count,
    required this.medalColor,
  });

  factory LeaderboardItem.fromEntity(LeaderboardEntity entity) {
    return LeaderboardItem(
      rank: _getOrdinal(entity.rank),
      author: entity.author,
      count: entity.count.toString(),
      medalColor: _medalColor(entity.rank),
    );
  }
}

Color? _medalColor(int rank) {
  switch (rank) {
    case 1:
      return Colors.amber;
    case 2:
      return Colors.grey;
    case 3:
      return Colors.brown;
    default:
      return null;
  }
}

String _getOrdinal(int number) {
  if (number >= 11 && number <= 13) {
    return '${number}th';
  }

  switch (number % 10) {
    case 1:
      return '${number}st';
    case 2:
      return '${number}nd';
    case 3:
      return '${number}rd';
    default:
      return '${number}th';
  }
}

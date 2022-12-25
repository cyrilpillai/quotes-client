import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../models/leaderboard_item.dart';

@immutable
abstract class LeaderboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LeaderboardState {}

class Loading extends LeaderboardState {}

class Success extends LeaderboardState {
  final List<LeaderboardItem> leaderboardItems;

  Success({required this.leaderboardItems});
}

class Error extends LeaderboardState {
  final String message;

  Error({required this.message});
}

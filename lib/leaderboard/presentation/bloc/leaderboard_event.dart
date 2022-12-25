import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class LeaderboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends LeaderboardEvent {}

class RefreshClicked extends LeaderboardEvent {}

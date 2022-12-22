import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../core/presentation/models/quote_item.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SearchState {}

class Loading extends SearchState {}

class Success extends SearchState {
  final List<QuoteItem> quotes;

  Success({required this.quotes});
}

class NotFound extends SearchState {}

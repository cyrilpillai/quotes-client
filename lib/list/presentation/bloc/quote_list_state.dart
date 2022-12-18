import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../models/quote_item.dart';

@immutable
abstract class QuoteListState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends QuoteListState {}

class Loading extends QuoteListState {}

class Success extends QuoteListState {
  final List<QuoteItem> quotes;

  Success({required this.quotes});
}

class Error extends QuoteListState {
  final String message;

  Error({required this.message});
}

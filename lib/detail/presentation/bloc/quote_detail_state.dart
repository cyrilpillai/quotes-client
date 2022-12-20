import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../core/presentation/models/quote_item.dart';

@immutable
abstract class QuoteDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends QuoteDetailState {}

class Loading extends QuoteDetailState {}

class Success extends QuoteDetailState {
  final QuoteItem quote;

  Success({required this.quote});
}

class Error extends QuoteDetailState {
  final String message;

  Error({required this.message});
}
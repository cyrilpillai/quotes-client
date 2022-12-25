import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../core/presentation/models/quote_item.dart';

@immutable
abstract class RandomQuoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends RandomQuoteState {}

class Loading extends RandomQuoteState {}

class Success extends RandomQuoteState {
  final QuoteItem quote;

  Success({required this.quote});
}

class Error extends RandomQuoteState {
  final String message;

  Error({required this.message});
}

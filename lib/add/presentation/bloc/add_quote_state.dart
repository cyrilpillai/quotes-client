import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../core/presentation/models/quote_item.dart';

@immutable
abstract class AddQuoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AddQuoteState {}

class Loading extends AddQuoteState {}

class Success extends AddQuoteState {
}

class Error extends AddQuoteState {
  final String message;

  Error({required this.message});
}
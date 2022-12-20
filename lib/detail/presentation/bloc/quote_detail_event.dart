import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class QuoteDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends QuoteDetailEvent {
  final String uuid;

  Initial({required this.uuid});
}

class BackClicked extends QuoteDetailEvent {}

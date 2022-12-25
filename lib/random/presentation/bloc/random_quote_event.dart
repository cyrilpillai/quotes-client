import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class RandomQuoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends RandomQuoteEvent {}

class RefreshClicked extends RandomQuoteEvent {}

class RandomizeClicked extends RandomQuoteEvent {}

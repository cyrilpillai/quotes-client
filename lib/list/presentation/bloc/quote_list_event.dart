import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class QuoteListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends QuoteListEvent {}

class RefreshClicked extends QuoteListEvent {}

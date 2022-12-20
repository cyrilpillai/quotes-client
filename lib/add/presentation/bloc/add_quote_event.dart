import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AddQuoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends AddQuoteEvent {}
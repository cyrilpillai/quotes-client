import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class EditQuoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends EditQuoteEvent {
  final String uuid;

  Initial({required this.uuid});
}

class AuthorChanged extends EditQuoteEvent {
  final String author;

  AuthorChanged({required this.author});
}

class TitleChanged extends EditQuoteEvent {
  final String title;

  TitleChanged({required this.title});
}

class DescriptionChanged extends EditQuoteEvent {
  final String description;

  DescriptionChanged({required this.description});
}

class SaveClicked extends EditQuoteEvent {}

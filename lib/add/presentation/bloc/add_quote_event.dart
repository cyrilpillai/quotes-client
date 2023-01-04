import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AddQuoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthorChanged extends AddQuoteEvent {
  final String author;

  AuthorChanged({required this.author});
}

class TitleChanged extends AddQuoteEvent {
  final String title;

  TitleChanged({required this.title});
}

class DescriptionChanged extends AddQuoteEvent {
  final String description;

  DescriptionChanged({required this.description});
}

class AddClicked extends AddQuoteEvent {}

class AddMoreClicked extends AddQuoteEvent {}

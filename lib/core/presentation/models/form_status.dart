import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class FormStatus extends Equatable {
  @override
  List<Object> get props => [];

  const FormStatus();
}

class InitialForm extends FormStatus {
  const InitialForm();
}

class FormSubmitting extends FormStatus {}

class SubmissionSuccess extends FormStatus {}

class SubmissionFailed extends FormStatus {
  final String message;

  const SubmissionFailed({required this.message});
}

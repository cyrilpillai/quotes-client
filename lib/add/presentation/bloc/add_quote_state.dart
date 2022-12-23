import 'form_status.dart';

class AddQuoteState {
  final String author;
  final String title;
  final String description;
  final FormStatus formStatus;

  bool get isAuthorValid => author.length > 3;
  bool get isTitleValid => author.length > 3;
  bool get isDescriptionValid => true;

  AddQuoteState({
    this.author = '',
    this.title = '',
    this.description = '',
    this.formStatus = const InitialForm(),
  });

  AddQuoteState copyWith({
    String? author,
    String? title,
    String? description,
    FormStatus? formStatus,
  }) {
    return AddQuoteState(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

import '../../../core/presentation/models/form_status.dart';

class EditQuoteState {
  final String uuid;
  final String author;
  final String title;
  final String description;
  final FormStatus formStatus;

  bool get isAuthorValid => author.length > 3;

  bool get isTitleValid => title.length > 3;

  bool get isDescriptionValid => true;

  EditQuoteState({
    this.uuid = '',
    this.author = '',
    this.title = '',
    this.description = '',
    this.formStatus = const InitialForm(),
  });

  EditQuoteState copyWith({
    String? uuid,
    String? author,
    String? title,
    String? description,
    FormStatus? formStatus,
  }) {
    return EditQuoteState(
      uuid: uuid ?? this.uuid,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

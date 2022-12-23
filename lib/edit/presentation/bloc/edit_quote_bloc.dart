import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import '../../../core/presentation/models/form_status.dart';
import 'edit_quote_event.dart';
import 'edit_quote_state.dart';

@injectable
class EditQuoteBloc extends Bloc<EditQuoteEvent, EditQuoteState> {
  final QuoteUseCase _quoteUseCase;

  EditQuoteBloc(this._quoteUseCase)
      : super(EditQuoteState(formStatus: FormSubmitting())) {
    on<Initial>((event, emit) => _fetchQuote(event, emit));
    on<AuthorChanged>((event, emit) async {
      emit(state.copyWith(author: event.author));
    });
    on<TitleChanged>((event, emit) async {
      emit(state.copyWith(title: event.title));
    });
    on<DescriptionChanged>((event, emit) async {
      emit(state.copyWith(description: event.description));
    });

    on<SaveClicked>((event, emit) => _editQuote(event, emit));
  }

  void _fetchQuote(
    Initial event,
    Emitter<EditQuoteState> emit,
  ) async {
    try {
      emit(state.copyWith(uuid: event.uuid, formStatus: FormSubmitting()));
      final quote =
          await _quoteUseCase.fetchQuote(event.uuid).catchError((error) {
        emit(state.copyWith(formStatus: const InitialForm()));
      });
      emit(state.copyWith(
        author: quote.author,
        title: quote.title,
        description: quote.description,
        formStatus: const InitialForm(),
      ));
    } catch (e) {
      emit(state.copyWith(formStatus: const InitialForm()));
    }
  }

  void _editQuote(
    SaveClicked event,
    Emitter<EditQuoteState> emit,
  ) async {
    try {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final description =
          state.description.isNotEmpty ? state.description : null;
      await _quoteUseCase.editQuote(
        state.uuid,
        state.author,
        state.title,
        description,
      );
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(message: e.toString())));
    }
  }
}

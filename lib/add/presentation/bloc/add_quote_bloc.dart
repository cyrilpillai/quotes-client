import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import 'add_quote_event.dart';
import 'add_quote_state.dart';
import 'form_status.dart';

@injectable
class AddQuoteBloc extends Bloc<AddQuoteEvent, AddQuoteState> {
  final QuoteUseCase _quoteUseCase;

  AddQuoteBloc(this._quoteUseCase) : super(AddQuoteState()) {
    on<AuthorChanged>((event, emit) async {
      emit(state.copyWith(author: event.author));
    });
    on<TitleChanged>((event, emit) async {
      emit(state.copyWith(title: event.title));
    });
    on<DescriptionChanged>((event, emit) async {
      emit(state.copyWith(description: event.description));
    });
    on<AddClicked>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        final description =
            state.description.isNotEmpty ? state.description : null;
        await _quoteUseCase.addQuote(
          state.author,
          state.title,
          description,
        );
        emit(AddQuoteState().copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(
            formStatus: SubmissionFailed(message: e.toString())));
      }
    });
  }
}

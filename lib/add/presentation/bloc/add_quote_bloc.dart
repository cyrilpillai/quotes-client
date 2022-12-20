import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import 'add_quote_event.dart';
import 'add_quote_state.dart';

@injectable
class AddQuoteBloc extends Bloc<AddQuoteEvent, AddQuoteState> {
  final QuoteUseCase _quoteUseCase;

  AddQuoteBloc(this._quoteUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchQuote(
          event,
          emit,
        ));
  }

  void _fetchQuote(
    Initial event,
    Emitter<AddQuoteState> emit,
  ) async {
    emit(Success());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import '../../../core/presentation/models/quote_item.dart';
import 'quote_detail_event.dart';
import 'quote_detail_state.dart';

@injectable
class QuoteDetailBloc extends Bloc<QuoteDetailEvent, QuoteDetailState> {
  final QuoteUseCase _quoteUseCase;

  QuoteDetailBloc(this._quoteUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchQuote(
          event,
          emit,
        ));
  }

  void _fetchQuote(
    Initial event,
    Emitter<QuoteDetailState> emit,
  ) async {
    emit(Loading());
    final quote =
        await _quoteUseCase.fetchQuote(event.uuid).catchError((error) {
      emit(Error(message: error.toString()));
    });
    emit(Success(quote: QuoteItem.fromEntity(quote)));
  }
}

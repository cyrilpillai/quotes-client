import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import '../../../core/presentation/models/quote_item.dart';
import 'quote_list_event.dart';
import 'quote_list_state.dart';

@injectable
class QuoteListBloc extends Bloc<QuoteListEvent, QuoteListState> {
  final QuoteUseCase _quoteUseCase;

  QuoteListBloc(this._quoteUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchQuotes(
          event,
          emit,
        ));
    on<RefreshClicked>((event, emit) => _fetchQuotes(
          event,
          emit,
          forceUpdate: true,
        ));
  }

  void _fetchQuotes(QuoteListEvent event, Emitter<QuoteListState> emit,
      {bool forceUpdate = false}) async {
    emit(Loading());
    final quotes =
        await _quoteUseCase.fetchQuotes(forceUpdate).catchError((error) {
      emit(Error(message: error.toString()));
    });

    final List<QuoteItem> list =
        quotes.map((e) => QuoteItem.fromEntity(e)).toList();
    emit(Success(quotes: list));
  }
}

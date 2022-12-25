import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/presentation/models/quote_item.dart';
import '../../domain/usecases/random_quote_usecase.dart';
import 'random_quote_event.dart';
import 'random_quote_state.dart';

@injectable
class RandomQuoteBloc extends Bloc<RandomQuoteEvent, RandomQuoteState> {
  final RandomQuoteUseCase _randomQuoteUseCase;

  RandomQuoteBloc(this._randomQuoteUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchQuote(event, emit));
    on<RefreshClicked>((event, emit) => _fetchQuote(event, emit));
    on<RandomizeClicked>((event, emit) => _fetchQuote(event, emit));
  }

  void _fetchQuote(
    RandomQuoteEvent event,
    Emitter<RandomQuoteState> emit,
  ) async {
    emit(Loading());
    final quote =
        await _randomQuoteUseCase.fetchRandomQuote().catchError((error) {
      emit(Error(message: error.toString()));
    });
    emit(Success(quote: QuoteItem.fromEntity(quote)));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/presentation/models/quote_item.dart';
import '../../domain/usecases/search_usecase.dart';
import 'search_event.dart';
import 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase;

  SearchBloc(this._searchUseCase) : super(Empty()) {
    on<Search>((event, emit) => _searchQuotes(
          event,
          emit,
        ));
  }

  void _searchQuotes(Search event, Emitter<SearchState> emit) async {
    emit(Loading());
    final quotes =
        await _searchUseCase.fetchQuotes(event.query).catchError((error) {
      emit(NotFound());
    });

    if (quotes.isEmpty) {
      emit(NotFound());
    } else {
      final List<QuoteItem> list =
          quotes.map((e) => QuoteItem.fromEntity(e)).toList();
      emit(Success(quotes: list));
    }
  }
}

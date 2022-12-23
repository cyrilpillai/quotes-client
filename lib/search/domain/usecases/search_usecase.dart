import 'package:injectable/injectable.dart';
import 'package:quotes/core/data/models/quote_response_dto.dart';

import '../../../core/data/repositories/quote_repository.dart';
import '../../../core/domain/entities/quote_entity.dart';

@injectable
class SearchUseCase {
  final QuoteRepository _quotesRepository;
  List<QuoteResponseDTO> quotes = List.empty();

  SearchUseCase(this._quotesRepository);

  Future<List<QuoteEntity>> fetchQuotes(String query) async {
    String lowerCaseQuery = query.toLowerCase();
    if (quotes.isEmpty) {
      quotes = await _quotesRepository.fetchQuotes(false);
    }

    return quotes
        .where((e) =>
            e.title.toLowerCase().contains(lowerCaseQuery) ||
            e.description.toLowerCase().contains(lowerCaseQuery) ||
            e.author.toLowerCase().contains(lowerCaseQuery))
        .map((e) => QuoteEntity.fromModel(e))
        .toList();
  }
}

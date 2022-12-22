import 'package:injectable/injectable.dart';

import '../../../core/data/repositories/quote_repository.dart';
import '../../../core/domain/entities/quote_entity.dart';

@injectable
class SearchUseCase {
  final QuoteRepository _quotesRepository;

  SearchUseCase(this._quotesRepository);

  Future<List<QuoteEntity>> fetchQuotes(String query) async {
    String lowerCaseQuery = query.toLowerCase();
    return (await _quotesRepository.fetchQuotes(false))
        .where((e) =>
            e.title.toLowerCase().contains(lowerCaseQuery) ||
            e.author.toLowerCase().contains(lowerCaseQuery))
        .map((e) => QuoteEntity.fromModel(e))
        .toList();
  }
}

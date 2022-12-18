import 'package:injectable/injectable.dart';

import '../../data/repositories/quote_repository.dart';
import '../entities/quote_entity.dart';

@injectable
class QuoteUseCase {
  final QuoteRepository _quotesRepository;

  QuoteUseCase(this._quotesRepository);

  Future<List<QuoteEntity>> fetchQuotes(bool forceUpdate) async {
    return (await _quotesRepository.fetchQuotes(forceUpdate))
        .map((e) => QuoteEntity.fromModel(e))
        .toList();
  }
}

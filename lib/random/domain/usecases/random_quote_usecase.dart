import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../../core/domain/entities/quote_entity.dart';
import '../../../core/domain/usecases/quote_usecase.dart';

@injectable
class RandomQuoteUseCase {
  final QuoteUseCase _quoteUseCase;
  final Random random = Random();

  RandomQuoteUseCase(this._quoteUseCase);

  Future<QuoteEntity> fetchRandomQuote() async {
    final quotes = await _quoteUseCase.fetchQuotes(false);
    return quotes[random.nextInt(quotes.length)];
  }
}

import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import '../entities/quote_chart_entity.dart';

@injectable
class QuoteChartUseCase {
  final QuoteUseCase _quoteUseCase;

  QuoteChartUseCase(this._quoteUseCase);

  Future<List<QuoteChartEntity>> fetchChartData() async {
    //Fetch all quotes
    final quotes = await _quoteUseCase.fetchQuotes(false);

    //Group by authors Map<Author, QuoteCount>
    final Map<String, int> groupByAuthor = {};
    for (var e in quotes) {
      final int currentCount = groupByAuthor[e.author] ?? 0;
      groupByAuthor[e.author] = currentCount + 1;
    }

    //Create list of authors with their percents
    List<QuoteChartEntity> chartEntities = List.empty(growable: true);
    groupByAuthor.forEach((key, value) {
      chartEntities.add(QuoteChartEntity(
        author: key,
        percent: (value / quotes.length) * 100,
      ));
    });

    //Sort by percent (descending)
    chartEntities.sort((a, b) => b.percent.compareTo(a.percent));

    //Take Top X authors
    const topX = 9;
    final result = chartEntities.take(topX).toList();

    //Club other authors in one
    double remainingPercent = 0;
    chartEntities.sublist(topX).forEach((e) {
      remainingPercent = remainingPercent + e.percent;
    });

    result.add(QuoteChartEntity(
      author: 'Others',
      percent: remainingPercent,
    ));
    return result;
  }
}

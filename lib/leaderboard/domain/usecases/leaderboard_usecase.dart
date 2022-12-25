import 'package:injectable/injectable.dart';

import '../../../core/domain/usecases/quote_usecase.dart';
import '../entities/leaderboard_entity.dart';

@injectable
class LeaderboardUseCase {
  final QuoteUseCase _quoteUseCase;

  LeaderboardUseCase(this._quoteUseCase);

  Future<List<LeaderboardEntity>> fetchLeaderboard() async {
    //Fetch all quotes
    final quotes = await _quoteUseCase.fetchQuotes(false);

    //Group by authors Map<Author, QuoteCount>
    final Map<String, int> groupByAuthor = {};
    for (var e in quotes) {
      final int currentCount = groupByAuthor[e.author] ?? 0;
      groupByAuthor[e.author] = currentCount + 1;
    }

    //Convert map to list and sort by quote count (descending)
    final list = groupByAuthor.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final List<LeaderboardEntity> result = List.empty(growable: true);
    for (var i = 0; i < list.length; i++) {
      result.add(LeaderboardEntity(
        rank: i + 1,
        author: list[i].key,
        count: list[i].value,
      ));
    }

    return result;
  }
}

import 'package:injectable/injectable.dart';

import '../models/quote_dto.dart';
import '../sources/quote_local_data_source.dart';
import '../sources/quote_remote_data_source.dart';

@injectable
class QuoteRepository {
  final QuoteLocalDataSource _localDataSource;
  final QuoteRemoteDataSource _remoteDataSource;

  QuoteRepository(this._localDataSource, this._remoteDataSource);

  Future<List<QuoteDTO>> fetchQuotes(bool forceUpdate) async {
    try {
      if (!forceUpdate) {
        return _localDataSource.fetchQuotes();
      } else {
        return _fetchQuotesRemote();
      }
    } catch (error) {
      return _fetchQuotesRemote();
    }
  }

  Future<List<QuoteDTO>> _fetchQuotesRemote() async {
    try {
      final response = await _remoteDataSource.fetchQuotes();
      if (response.statusCode == 200) {
        final quotes = (response.data as List)
            .map((e) => QuoteDTO.fromJson(e))
            .toList();
        _localDataSource.saveQuotes(quotes);
        return quotes;
      } else {
        throw Exception("Server error");
      }
    } catch (error) {
      rethrow;
    }
  }
}

import 'package:injectable/injectable.dart';

import '../../../core/data/models/quote_dto.dart';
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
        return await _localDataSource.fetchQuotes();
      } else {
        return _fetchQuotesRemote();
      }
    } catch (error) {
      return _fetchQuotesRemote();
    }
  }

  Future<QuoteDTO> fetchQuote(String uuid) async {
    try {
      return await _localDataSource.fetchQuote(uuid);
    } catch (error) {
      return await _fetchQuoteRemote(uuid);
    }
  }

  Future<List<QuoteDTO>> _fetchQuotesRemote() async {
    try {
      final response = await _remoteDataSource.fetchQuotes();
      if (response.statusCode == 200) {
        final quotes =
            (response.data as List).map((e) => QuoteDTO.fromJson(e)).toList();
        _localDataSource.saveQuotes(quotes);
        return quotes;
      } else {
        throw Exception("Server error");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<QuoteDTO> _fetchQuoteRemote(String uuid) async {
    try {
      final response = await _remoteDataSource.fetchQuote(uuid);
      if (response.statusCode == 200) {
        final quote = QuoteDTO.fromJson(response.data);
        _localDataSource.saveQuote(quote);
        return quote;
      } else if (response.statusCode == 404) {
        throw Exception('Quote not found');
      } else {
        throw Exception('Server error');
      }
    } catch (error) {
      rethrow;
    }
  }
}

import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../core/data/models/quote_response_dto.dart';
import '../models/quote_request_dto.dart';
import '../sources/quote_local_data_source.dart';
import '../sources/quote_remote_data_source.dart';

@injectable
class QuoteRepository {
  final QuoteLocalDataSource _localDataSource;
  final QuoteRemoteDataSource _remoteDataSource;

  QuoteRepository(this._localDataSource, this._remoteDataSource);

  Future<List<QuoteResponseDTO>> fetchQuotes(bool forceUpdate) async {
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

  Future<QuoteResponseDTO> fetchQuote(String uuid) async {
    try {
      return await _localDataSource.fetchQuote(uuid);
    } catch (error) {
      return await _fetchQuoteRemote(uuid);
    }
  }

  Future<QuoteResponseDTO> addQuote(
    String author,
    String title,
    String? description,
  ) async {
    try {
      final quoteRequestDTO = QuoteRequestDTO(title, description, author);
      final response = await _remoteDataSource.addQuote(quoteRequestDTO);
      if (response.statusCode == 200) {
        final newQuote = QuoteResponseDTO.fromJson(response.data);
        _localDataSource.saveQuote(newQuote);
        return newQuote;
      } else if (response.statusCode == 400) {
        throw Exception('Input error');
      } else {
        throw Exception('Server error');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<List<QuoteResponseDTO>> _fetchQuotesRemote() async {
    try {
      final response = await _remoteDataSource.fetchQuotes();
      if (response.statusCode == 200) {
        final quotes = (response.data as List)
            .map((e) => QuoteResponseDTO.fromJson(e))
            .toList();
        _localDataSource.saveQuotes(quotes);
        return quotes;
      } else {
        throw Exception('Server error');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<QuoteResponseDTO> _fetchQuoteRemote(String uuid) async {
    try {
      final response = await _remoteDataSource.fetchQuote(uuid);
      if (response.statusCode == 200) {
        final quote = QuoteResponseDTO.fromJson(response.data);
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

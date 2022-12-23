import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/models/quote_response_dto.dart';

const quotesCache = 'quotes_cache';

@injectable
class QuoteLocalDataSource {
  final SharedPreferences _sharedPreferences;

  QuoteLocalDataSource(this._sharedPreferences);

  Future<List<QuoteResponseDTO>> fetchQuotes() async {
    final jsonString = _sharedPreferences.getString(quotesCache);
    if (jsonString != null) {
      return Future.value((jsonDecode(jsonString) as List)
          .map((e) => QuoteResponseDTO.fromJson(e))
          .toList());
    } else {
      throw Exception('Cache miss');
    }
  }

  Future<QuoteResponseDTO> fetchQuote(String uuid) async {
    final list = await fetchQuotes();
    return list.firstWhere((element) => element.uuid == uuid);
  }

  saveQuotes(List<QuoteResponseDTO> quotes) async {
    final list = quotes.map((e) => e.toJson()).toList();
    _sharedPreferences.setString(quotesCache, jsonEncode(list));
  }

  saveQuote(QuoteResponseDTO quote) async {
    final list = await fetchQuotes();
    list.add(quote);
    _sharedPreferences.setString(quotesCache, jsonEncode(list));
  }

  updateQuote(QuoteResponseDTO quote) async {
    final list = await fetchQuotes();
    final index = list.indexWhere((e) => e.uuid == quote.uuid);
    list[index] = quote;
    _sharedPreferences.setString(quotesCache, jsonEncode(list));
  }
}

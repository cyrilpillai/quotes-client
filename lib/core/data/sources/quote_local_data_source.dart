import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/models/quote_dto.dart';

const quotesCache = 'quotes_cache';

@injectable
class QuoteLocalDataSource {
  final SharedPreferences _sharedPreferences;

  QuoteLocalDataSource(this._sharedPreferences);

  Future<List<QuoteDTO>> fetchQuotes() async {
    final jsonString = _sharedPreferences.getString(quotesCache);
    if (jsonString != null) {
      return Future.value((jsonDecode(jsonString) as List)
          .map((e) => QuoteDTO.fromJson(e))
          .toList());
    } else {
      throw Exception('Cache miss');
    }
  }

  Future<QuoteDTO> fetchQuote(String uuid) async {
    final list = await fetchQuotes();
    return list.firstWhere((element) => element.uuid == uuid);
  }

  saveQuotes(List<QuoteDTO> quotes) async {
    final list = quotes.map((e) => e.toJson()).toList();
    _sharedPreferences.setString(quotesCache, jsonEncode(list));
  }

  saveQuote(QuoteDTO quote) async {
    final list = await fetchQuotes();
    list.add(quote);
    _sharedPreferences.setString(quotesCache, jsonEncode(list));
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/quote_request_dto.dart';

@injectable
class QuoteRemoteDataSource {
  final Dio _dio;

  QuoteRemoteDataSource(this._dio);

  Future<Response<dynamic>> fetchQuotes() async {
    return _dio.get('quotes');
  }

  Future<Response<dynamic>> fetchQuote(String uuid) async {
    return _dio.get('quotes/$uuid');
  }

  Future<Response<dynamic>> addQuote(QuoteRequestDTO quoteRequestDTO) async {
    return _dio.post('quotes/', data: quoteRequestDTO.toJson());
  }

  Future<Response<dynamic>> editQuote(
    String uuid,
    QuoteRequestDTO quoteRequestDTO,
  ) async {
    return _dio.put('quotes/$uuid', data: quoteRequestDTO.toJson());
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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
}

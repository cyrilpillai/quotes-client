import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named("BaseUrl")
  String get baseUrl => 'https://api.cyrilpillai.com/';

  @Named("LocalBaseUrl")
  String get localBaseUrl => 'http://192.168.0.219:8080/';

  @lazySingleton
  Dio dio(
      @Named('BaseUrl') String url,
      Interceptor interceptor,
      ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: 5000,
        receiveTimeout: 10000,
      ),
    );
    dio.interceptors.add(interceptor);
    return dio;
  }

  @lazySingleton
  Interceptor interceptor(DioCacheManager cacheManager) =>
      cacheManager.interceptor;

  @lazySingleton
  DioCacheManager cacheManager(CacheConfig cacheConfig) =>
      DioCacheManager(cacheConfig);

  @lazySingleton
  CacheConfig cacheConfig() => CacheConfig(
    defaultMaxAge: const Duration(days: 10),
    maxMemoryCacheCount: 3,
  );
}

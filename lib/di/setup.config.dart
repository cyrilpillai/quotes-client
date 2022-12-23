// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:dio_http_cache/dio_http_cache.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../add/presentation/bloc/add_quote_bloc.dart' as _i11;
import '../core/data/repositories/quote_repository.dart' as _i8;
import '../core/data/sources/quote_local_data_source.dart' as _i6;
import '../core/data/sources/quote_remote_data_source.dart' as _i7;
import '../core/domain/usecases/quote_usecase.dart' as _i9;
import '../detail/presentation/bloc/quote_detail_bloc.dart' as _i13;
import '../edit/presentation/bloc/edit_quote_bloc.dart' as _i12;
import '../list/presentation/bloc/quote_list_bloc.dart' as _i14;
import '../search/domain/usecases/search_usecase.dart' as _i10;
import '../search/presentation/bloc/search_bloc.dart' as _i15;
import 'network.dart' as _i16;
import 'persistence.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> init(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final persistenceModule = _$PersistenceModule();
  gh.lazySingleton<_i3.CacheConfig>(() => networkModule.cacheConfig());
  gh.lazySingleton<_i3.DioCacheManager>(
      () => networkModule.cacheManager(get<_i3.CacheConfig>()));
  gh.lazySingleton<_i4.Interceptor>(
      () => networkModule.interceptor(get<_i3.DioCacheManager>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => persistenceModule.preferences,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<String>(
    () => networkModule.localBaseUrl,
    instanceName: 'LocalBaseUrl',
  );
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio(
        get<String>(instanceName: 'BaseUrl'),
        get<_i4.Interceptor>(),
      ));
  gh.factory<_i6.QuoteLocalDataSource>(
      () => _i6.QuoteLocalDataSource(get<_i5.SharedPreferences>()));
  gh.factory<_i7.QuoteRemoteDataSource>(
      () => _i7.QuoteRemoteDataSource(get<_i4.Dio>()));
  gh.factory<_i8.QuoteRepository>(() => _i8.QuoteRepository(
        get<_i6.QuoteLocalDataSource>(),
        get<_i7.QuoteRemoteDataSource>(),
      ));
  gh.factory<_i9.QuoteUseCase>(
      () => _i9.QuoteUseCase(get<_i8.QuoteRepository>()));
  gh.factory<_i10.SearchUseCase>(
      () => _i10.SearchUseCase(get<_i8.QuoteRepository>()));
  gh.factory<_i11.AddQuoteBloc>(
      () => _i11.AddQuoteBloc(get<_i9.QuoteUseCase>()));
  gh.factory<_i12.EditQuoteBloc>(
      () => _i12.EditQuoteBloc(get<_i9.QuoteUseCase>()));
  gh.factory<_i13.QuoteDetailBloc>(
      () => _i13.QuoteDetailBloc(get<_i9.QuoteUseCase>()));
  gh.factory<_i14.QuoteListBloc>(
      () => _i14.QuoteListBloc(get<_i9.QuoteUseCase>()));
  gh.factory<_i15.SearchBloc>(() => _i15.SearchBloc(get<_i10.SearchUseCase>()));
  return get;
}

class _$NetworkModule extends _i16.NetworkModule {}

class _$PersistenceModule extends _i17.PersistenceModule {}

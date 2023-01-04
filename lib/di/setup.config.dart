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

import '../add/presentation/bloc/add_quote_bloc.dart' as _i16;
import '../chart/domain/usecases/quote_chart_usecase.dart' as _i19;
import '../chart/presentation/bloc/quote_chart_bloc.dart' as _i25;
import '../core/data/repositories/quote_repository.dart' as _i11;
import '../core/data/sources/quote_local_data_source.dart' as _i9;
import '../core/data/sources/quote_remote_data_source.dart' as _i10;
import '../core/domain/usecases/quote_usecase.dart' as _i12;
import '../detail/presentation/bloc/quote_detail_bloc.dart' as _i20;
import '../edit/presentation/bloc/edit_quote_bloc.dart' as _i17;
import '../leaderboard/domain/usecases/leaderboard_usecase.dart' as _i18;
import '../leaderboard/presentation/bloc/leaderboard_bloc.dart' as _i24;
import '../list/presentation/bloc/quote_list_bloc.dart' as _i21;
import '../random/domain/usecases/random_quote_usecase.dart' as _i13;
import '../random/presentation/bloc/random_quote_bloc.dart' as _i22;
import '../search/domain/usecases/search_usecase.dart' as _i14;
import '../search/presentation/bloc/search_bloc.dart' as _i23;
import '../theme/data/repositories/theme_repository.dart' as _i7;
import '../theme/data/sources/theme_local_data_source.dart' as _i6;
import '../theme/domain/usecases/theme_usecase.dart' as _i8;
import '../theme/presentation/cubit/theme_cubit.dart' as _i15;
import 'network.dart' as _i26;
import 'persistence.dart' as _i27; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.ThemeLocalDataSource>(
      () => _i6.ThemeLocalDataSource(get<_i5.SharedPreferences>()));
  gh.factory<_i7.ThemeRepository>(
      () => _i7.ThemeRepository(get<_i6.ThemeLocalDataSource>()));
  gh.factory<_i8.ThemeUseCase>(
      () => _i8.ThemeUseCase(get<_i7.ThemeRepository>()));
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio(
        get<String>(instanceName: 'BaseUrl'),
        get<_i4.Interceptor>(),
      ));
  gh.factory<_i9.QuoteLocalDataSource>(
      () => _i9.QuoteLocalDataSource(get<_i5.SharedPreferences>()));
  gh.factory<_i10.QuoteRemoteDataSource>(
      () => _i10.QuoteRemoteDataSource(get<_i4.Dio>()));
  gh.factory<_i11.QuoteRepository>(() => _i11.QuoteRepository(
        get<_i9.QuoteLocalDataSource>(),
        get<_i10.QuoteRemoteDataSource>(),
      ));
  gh.factory<_i12.QuoteUseCase>(
      () => _i12.QuoteUseCase(get<_i11.QuoteRepository>()));
  gh.factory<_i13.RandomQuoteUseCase>(
      () => _i13.RandomQuoteUseCase(get<_i12.QuoteUseCase>()));
  gh.factory<_i14.SearchUseCase>(
      () => _i14.SearchUseCase(get<_i11.QuoteRepository>()));
  gh.lazySingleton<_i15.ThemeCubit>(
      () => _i15.ThemeCubit(get<_i8.ThemeUseCase>()));
  gh.factory<_i16.AddQuoteBloc>(
      () => _i16.AddQuoteBloc(get<_i12.QuoteUseCase>()));
  gh.factory<_i17.EditQuoteBloc>(
      () => _i17.EditQuoteBloc(get<_i12.QuoteUseCase>()));
  gh.factory<_i18.LeaderboardUseCase>(
      () => _i18.LeaderboardUseCase(get<_i12.QuoteUseCase>()));
  gh.factory<_i19.QuoteChartUseCase>(
      () => _i19.QuoteChartUseCase(get<_i12.QuoteUseCase>()));
  gh.factory<_i20.QuoteDetailBloc>(
      () => _i20.QuoteDetailBloc(get<_i12.QuoteUseCase>()));
  gh.factory<_i21.QuoteListBloc>(
      () => _i21.QuoteListBloc(get<_i12.QuoteUseCase>()));
  gh.factory<_i22.RandomQuoteBloc>(
      () => _i22.RandomQuoteBloc(get<_i13.RandomQuoteUseCase>()));
  gh.factory<_i23.SearchBloc>(() => _i23.SearchBloc(get<_i14.SearchUseCase>()));
  gh.factory<_i24.LeaderboardBloc>(
      () => _i24.LeaderboardBloc(get<_i18.LeaderboardUseCase>()));
  gh.factory<_i25.QuoteChartBloc>(
      () => _i25.QuoteChartBloc(get<_i19.QuoteChartUseCase>()));
  return get;
}

class _$NetworkModule extends _i26.NetworkModule {}

class _$PersistenceModule extends _i27.PersistenceModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api_helper.dart' as _i4;
import 'core/infrastructure/dio_injectable_module.dart' as _i11;
import 'feature/application/movie/movie_bloc.dart' as _i9;
import 'feature/application/search/search_bloc.dart' as _i10;
import 'feature/infrastructure/movie/movie_remote_data_source.dart' as _i5;
import 'feature/infrastructure/movie/movie_repository.dart' as _i6;
import 'feature/infrastructure/search/search_remote_data_source.dart' as _i7;
import 'feature/infrastructure/search/search_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioInjectableModule = _$DioInjectableModule();
  gh.lazySingleton<_i3.Dio>(() => dioInjectableModule.dio);
  gh.singleton<_i4.ApiHelper>(_i4.ApiHelper(get<_i3.Dio>()));
  gh.factory<_i5.MovieRemoteDataSource>(
      () => _i5.MovieRemoteDataSource(get<_i4.ApiHelper>()));
  gh.factory<_i6.MovieRepository>(
      () => _i6.MovieRepository(get<_i5.MovieRemoteDataSource>()));
  gh.factory<_i7.SearchMovieRemoteDataSource>(
      () => _i7.SearchMovieRemoteDataSource(get<_i4.ApiHelper>()));
  gh.factory<_i8.SearchMovieRepository>(
      () => _i8.SearchMovieRepository(get<_i7.SearchMovieRemoteDataSource>()));
  gh.factory<_i9.MovieBloc>(() => _i9.MovieBloc(get<_i6.MovieRepository>()));
  gh.factory<_i10.SearchBloc>(
      () => _i10.SearchBloc(get<_i8.SearchMovieRepository>()));
  return get;
}

class _$DioInjectableModule extends _i11.DioInjectableModule {}

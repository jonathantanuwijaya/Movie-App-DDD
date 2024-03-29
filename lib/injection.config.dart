// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/infrastructure/api_helper.dart' as _i6;
import 'core/infrastructure/dio_injectable_module.dart' as _i14;
import 'feature/application/auth/auth_bloc.dart' as _i7;
import 'feature/application/movie/movie_bloc.dart' as _i12;
import 'feature/application/search/search_bloc.dart' as _i13;
import 'feature/domain/auth/i_auth_facade.dart' as _i4;
import 'feature/infrastructure/auth/auth_repository.dart' as _i5;
import 'feature/infrastructure/movie/movie_remote_data_source.dart' as _i8;
import 'feature/infrastructure/movie/movie_repository.dart' as _i9;
import 'feature/infrastructure/search/search_remote_data_source.dart' as _i10;
import 'feature/infrastructure/search/search_repository.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioInjectableModule = _$DioInjectableModule();
  gh.lazySingleton<_i3.Dio>(() => dioInjectableModule.dio);
  gh.factory<_i4.IAuthFacade>(() => _i5.AuthRepository());
  gh.singleton<_i6.ApiHelper>(_i6.ApiHelper(get<_i3.Dio>()));
  gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(get<_i4.IAuthFacade>()));
  gh.factory<_i8.MovieRemoteDataSource>(
      () => _i8.MovieRemoteDataSource(get<_i6.ApiHelper>()));
  gh.factory<_i9.MovieRepository>(
      () => _i9.MovieRepository(get<_i8.MovieRemoteDataSource>()));
  gh.factory<_i10.SearchMovieRemoteDataSource>(
      () => _i10.SearchMovieRemoteDataSource(get<_i6.ApiHelper>()));
  gh.factory<_i11.SearchMovieRepository>(() =>
      _i11.SearchMovieRepository(get<_i10.SearchMovieRemoteDataSource>()));
  gh.factory<_i12.MovieBloc>(() => _i12.MovieBloc(get<_i9.MovieRepository>()));
  gh.factory<_i13.SearchBloc>(
      () => _i13.SearchBloc(get<_i11.SearchMovieRepository>()));
  return get;
}

class _$DioInjectableModule extends _i14.DioInjectableModule {}

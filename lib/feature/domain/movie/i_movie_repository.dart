import 'package:dartz/dartz.dart';
import 'package:movieapp/core/failures.dart';
import 'package:movieapp/feature/domain/movie/movies.dart';

abstract class IMovieRepository{
  Future<Either<MovieFailure,List<Movie>>> getAllMovies();
}
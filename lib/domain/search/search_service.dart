import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/search/model/search_rep/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRep>> searchMovies({
    required String movieQuery,
  });
}

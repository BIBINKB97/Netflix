import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/search_service.dart';

import '../../domain/core/api_end_point.dart';
import '../../domain/core/failures/main_failures.dart';
import '../../domain/search/model/search_rep/search_response.dart';

@LazySingleton(as: SearchService)
class SearchIpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchRep>> searchMovies(
      {required String movieQuery}) async {
    log(movieQuery);
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRep.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.severFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}

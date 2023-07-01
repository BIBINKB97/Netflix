import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/week?api_key=$apiKey";
  static const search = '$kBaseUrl/search/movie?api_key=$apiKey';

  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$apiKey';
  static const upcomingmovie = '$kBaseUrl/trending/all/week?api_key=$apiKey';
  static const everyoneseenmovie =
      '$kBaseUrl/trending/all/week?api_key=$apiKey';
  static const tensedrrama = '$kBaseUrl/movie/top_rated?api_key=$apiKey';
  static const soutindianmovie = '$kBaseUrl/discover/tv?api_key=$apiKey';
  static const top10showindia = '$kBaseUrl/movie/now_playing?api_key=$apiKey';
  static const homeMainimage = '$kBaseUrl/movie/now_playing?api_key=$apiKey';
}

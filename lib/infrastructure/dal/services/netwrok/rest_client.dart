import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../daos/models/movieListModel.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.tvmaze.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/search/shows')
  Future<List<MovieListModel>> movieListModel(
      @Queries() Map<String, String> query);
}

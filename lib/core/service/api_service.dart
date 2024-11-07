import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../model/response/photos_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  @GET("v1/curated")
  Future<PhotosResponse> getPhotos(
      @Query("page") int page, @Query("per_page") int limit);

  @GET("v1/search")
  Future<PhotosResponse> searchPhotos(@Query("query") String keyword,
      @Query("page") int page, @Query("per_page") int limit);


}

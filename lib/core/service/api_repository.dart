
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

import '../constraint/const.dart';
import 'api_service.dart';

class ApiRepository{
  late final Dio _dio;
  late final ApiService _apiService;


  ApiRepository(){
    _dio = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        contentType: "application/json"
    ))..interceptors.add(HttpFormatter());

    _dio.options.headers["Authorization"] = appId;

    _apiService = ApiService(_dio, baseUrl: baseUrl);
  }

  ApiService get apiService => _apiService;

}
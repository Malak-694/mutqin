import 'package:dio/dio.dart';
import 'package:mutqin/core/networking/api_endpoints.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @GET(ApiEndpoints.login)
  Future <void> getUserData();
}
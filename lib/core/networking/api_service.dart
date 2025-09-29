import 'package:dio/dio.dart';
import 'package:mutqin/core/networking/api_endpoints.dart';
import 'package:mutqin/features/auth/data/models/sign_up_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/data/models/login_model.dart';
import '../../features/auth/data/models/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @POST(ApiEndpoints.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequest body);
  @POST(ApiEndpoints.login)
  Future<LoginResponse> logIn(@Body() LoginRequest body);
   @GET("/profile/search")
  Future<User> getUser(
    @Query("emailOrUsername") String emailOrUsername,
   
  );
}

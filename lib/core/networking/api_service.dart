import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mutqin/core/networking/api_endpoints.dart';
import 'package:mutqin/features/auth/data/model/sign_up_model.dart';
import 'package:mutqin/features/notification/data/model/notification_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/data/model/login_model.dart';
import '../../features/auth/data/model/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @POST(ApiEndpoints.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequest body);

  @POST(ApiEndpoints.login)
  Future<LoginResponse> logIn(@Body() LoginRequest body);

  @GET(ApiEndpoints.userProfile)
  Future<User> getUser(@Query("emailOrUsername") String emailOrUsername);

  @GET(ApiEndpoints.notificationAll)
  Future<List<Message>> getNotificationsAll(@Path("id") String id);

  @GET(ApiEndpoints.notificationUnread)
  Future<List<Message>> getNotificationsUnread(@Path("id") String id);

  @PUT(ApiEndpoints.readNotification)
  Future<void> readNotification(@Path("notiId") String id);
}

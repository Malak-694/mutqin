import 'package:dio/dio.dart';
import 'package:mutqin/core/networking/api_endpoints.dart';
import 'package:mutqin/features/auth/data/model/sign_up_model.dart';
import 'package:mutqin/features/notification/data/model/notification_model.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';
import 'package:mutqin/features/sheikh_features/data/model/calendy_model.dart';
import 'package:mutqin/features/student_features/data/models/book_session.dart';
import 'package:mutqin/features/student_features/data/models/progress_model.dart';
import 'package:mutqin/features/student_features/data/models/session_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/data/model/login_model.dart';
import '../../features/auth/data/model/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  //General

  @GET(ApiEndpoints.getByRole)
  Future<List<ProfileModel>> getByRole(@Path("role") String role);

  @GET(ApiEndpoints.userProfileToken)
  Future<User> getUserbyToken(@Header("Authorization") String token);

   @GET(ApiEndpoints.progress)
  Future<List<ProgressModel>> getProgress(@Path("username") String username);


  //Authentication
  @POST(ApiEndpoints.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequest body);

  @POST(ApiEndpoints.login)
  Future<LoginResponse> logIn(@Body() LoginRequest body);

  //Notification
  @GET(ApiEndpoints.notificationAll)
  Future<List<Message>> getNotificationsAll(@Path("id") String id);

  @GET(ApiEndpoints.notificationUnread)
  Future<List<Message>> getNotificationsUnread(@Path("id") String id);

  @PUT(ApiEndpoints.readNotification)
  Future<void> readNotification(@Path("notiId") String id);

  //Profile
  @PUT(ApiEndpoints.updateProfile)
  Future<ProfileModel> upadteProfile(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> profile,
  );
  @DELETE(ApiEndpoints.updateProfile)
  Future<String> deleteProfile(@Header("Authorization") String token);

  //Student
  @POST(ApiEndpoints.bookSession)
  Future<BookResponseModel> bookSession(@Body() BookRequestModel body);

  @GET(ApiEndpoints.getSessions)
  Future<List<SessionModel>> getSessions(@Path("username") String username);

 
  //Sheikh
  @POST(ApiEndpoints.calendy)
  Future<CalendyResponseModel> postCalendy(@Path("username") String username, @Body() CalendyModel body);

  @GET(ApiEndpoints.tutorSessions)
  Future<List<SessionModel>> getTutorSessions(@Path("username") String username);

  @GET(ApiEndpoints.tutorStudents)
  Future<List<ProfileModel>> getTutorStudents(@Path("username") String username);

   @POST(ApiEndpoints.progress)
  Future<ProgressModel> postProgress(@Path("username") String username
  ,@Body() Map<String,dynamic> body);



}

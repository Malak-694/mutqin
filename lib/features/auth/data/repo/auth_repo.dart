import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/features/auth/data/model/sign_up_model.dart';
import 'package:mutqin/features/auth/data/model/user_model.dart';

import '../model/login_model.dart';

class AuthRepo {
  ApiService apiService;
  AuthRepo({required this.apiService});
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest body) async {
    try {
      final response = await apiService.signUp(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }

  }
  Future<ApiResult<LoginResponse>> logIn(LoginRequest body) async {
    try {
      final response = await apiService.logIn(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
Future<ApiResult<User>> getUser(String emailOrUsername) async {
    try {
      final response = await apiService.getUser(emailOrUsername);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

}

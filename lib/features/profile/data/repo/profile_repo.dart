// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';

import '../../../auth/data/model/user_model.dart';

class ProfileRepo {
  ApiService apiService;
  ProfileRepo({required this.apiService});
  Future<ApiResult<User>> getUserbyToken(String token) async {
    try {
      final response = await apiService.getUserbyToken("Bearer $token");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<ProfileModel>> updateProfile(
    String token,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await apiService.upadteProfile("Bearer $token", body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<String>> deleteProfile(String token) async {
    try {
      final response = await apiService.deleteProfile("Bearer $token");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}

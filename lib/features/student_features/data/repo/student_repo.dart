// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/features/student_features/data/models/book_session.dart';
import 'package:mutqin/features/student_features/data/models/progress_model.dart';

import '../../../profile/data/model/profile_model.dart';
import '../models/session_model.dart';

class StudentRepo {
  ApiService apiService;
  StudentRepo({required this.apiService});
  Future<ApiResult<List<ProfileModel>>> getByRole(String role) async {
    try {
      final response = await apiService.getByRole(role);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<BookResponseModel>> bookSession(
    BookRequestModel body,
  ) async {
    try {
      final data = await apiService.bookSession(body);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<SessionModel>>> getSessions(String username) async {
    try {
      final data = await apiService.getSessions(username);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<ProgressModel>>> getProgress(String username) async {
    try {
      final data = await apiService.getProgress(username);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}

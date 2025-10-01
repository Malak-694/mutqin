import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/core/networking/api_service.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';
import 'package:mutqin/features/sheikh_features/data/model/calendy_model.dart';
import 'package:mutqin/features/student_features/data/models/progress_model.dart';
import 'package:mutqin/features/student_features/data/models/session_model.dart';

class SheikhRepo {
  ApiService apiService;
  SheikhRepo({required this.apiService});
Future<ApiResult<CalendyResponseModel>> postCalendy(String username, CalendyModel body) async {
    try {
      final response = await apiService.postCalendy(username,body );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
  Future <ApiResult<List<SessionModel>> > getTutorSessions(String username) async {
    try {
      final response = await apiService.getTutorSessions(username );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }


  }

  Future <ApiResult<List<ProgressModel>> > getProgress(String username) async {
    try {
      final response = await apiService.getProgress(username );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
  Future <ApiResult<ProgressModel> > postProgress(String username, Map<String,dynamic> body) async {
    try {
      final response = await apiService.postProgress(username,body );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

Future <ApiResult<List<ProfileModel>> > getTutorStudents(String username, ) async {
    try {
      final response = await apiService.getTutorStudents(username );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  

}

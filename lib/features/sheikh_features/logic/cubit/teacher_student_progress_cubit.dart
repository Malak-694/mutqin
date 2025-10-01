import 'package:bloc/bloc.dart';
import 'package:mutqin/core/di/dependency_injection.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/features/sheikh_features/data/repo/sheikh_repo.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_student_progress_state.dart';
import 'package:mutqin/features/student_features/data/models/progress_model.dart';

import '../../../../core/networking/api_result.dart';

class SheikhStudentProgressCubit extends Cubit<SheikhStudentProgressState> {
  SheikhRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();
  String? username;
  List<ProgressModel>? progress;
  SheikhStudentProgressCubit(this.repo)
    : super(SheikhStudentProgressState.initial());
  Future<void> getProgress(String username) async {
    emit(SheikhStudentProgressState.loading());

    emit(const SheikhStudentProgressState.loading());

    final ApiResult<List<ProgressModel>> result = await repo.getProgress(
      username,
    );
    result.when(
      success: (data) {
        progress = data;

        emit(SheikhStudentProgressState.success(progress));
      },
      failure: (error) {
        emit(
          const SheikhStudentProgressState.fail(
            "نحن نواجه مشكلة ونعمل على حلها",
          ),
        );
      },
    );
  }

  Future<void> postProgress({
    String? username,
    String? pagesLearned,
    String? numberOfSessionsAttended,
    String? points,
  }) async {
    if (username == null) {
      emit(const SheikhStudentProgressState.fail("هذا الطالب غير موجود"));
      return;
    }

    // Update the local model first
    final Map<String, dynamic> body = {};
    if (pagesLearned != null) body['pagesLearned'] = pagesLearned;
    if (numberOfSessionsAttended != null)
      body['numberOfSessionsAttended'] = numberOfSessionsAttended;
    if (points != null) body['points'] = points;

    final ApiResult<ProgressModel> result = await repo.postProgress(
      username,
      body,
    );

    result.when(
      success: (data) {
        emit(SheikhStudentProgressState.success("تم تعديل الخانات المطلوبة"));
        getProgress(username);
      },
      failure: (error) {
        emit(
          const SheikhStudentProgressState.fail(
            "نحن نواجه مشكلة ونعمل على حلها2",
          ),
        );
      },
    );
  }
}

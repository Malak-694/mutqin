import 'package:bloc/bloc.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/student_features/data/repo/student_repo.dart';
import 'package:mutqin/features/student_features/logic/cubit/progress_state.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helper/shared_key.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/models/progress_model.dart';

class ProgressCubit extends Cubit<ProgressState> {
  StudentRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();
  String? username;
  List<ProgressModel>? progresses;

  ProgressCubit(this.repo) : super(ProgressState.initial()) {
    getProgress();
  }
  Future<void> getProgress() async {
    final username = await prefs.getData(SharedPrefKey.username);

    emit(const ProgressState.loading());
    if (username == null) {
      emit(const ProgressState.fail("لم يتم العثور على المستخدم"));
      return;
    }
    final ApiResult<List<ProgressModel>> result = await repo.getProgress(
      username,
    );
    result.when(
      success: (data) {
        progresses = data;

        emit(ProgressState.success(progresses));
      },
      failure: (error) {
        emit(const ProgressState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}

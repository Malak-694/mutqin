import 'package:bloc/bloc.dart';
import 'package:mutqin/core/di/dependency_injection.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/sheikh_features/data/repo/sheikh_repo.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_sessions_state.dart';
import 'package:mutqin/features/student_features/data/models/session_model.dart';

class SheikhSessionsCubit extends Cubit<SheikhSessionsState> {
  SheikhRepo repo;
  List<SessionModel>? sessions;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();

  SheikhSessionsCubit(this.repo) : super(SheikhSessionsState.initial()) {
    getSessions();
  }

  Future<void> getSessions() async {
    final username = await prefs.getData(SharedPrefKey.username);

    emit(const SheikhSessionsState.loading());
    if (username == null) {
      emit(const SheikhSessionsState.fail("لم يتم العثور على المستخدم"));
      return;
    }
    final ApiResult<List<SessionModel>> result = await repo.getTutorSessions(
      username,
    );
    result.when(
      success: (data) {
        sessions = data;
        emit(SheikhSessionsState.success(sessions));
      },
      failure: (error) {
        emit(const SheikhSessionsState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}

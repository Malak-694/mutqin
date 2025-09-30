import 'package:bloc/bloc.dart';
import 'package:mutqin/features/student_features/data/models/session_model.dart';
import 'package:mutqin/features/student_features/data/repo/student_repo.dart';
import 'package:mutqin/features/student_features/logic/cubit/sessions_state.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helper/shared_key.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';

class SessionsCubit extends Cubit<SessionsState> {
  StudentRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();
  String? username;
  List<SessionModel>? sessions;

  SessionsCubit(this.repo) : super(SessionsState.initial()) {
    getSessions();
  }
  Future<void> getSessions() async {
    final username = await prefs.getData(SharedPrefKey.username);

    emit(const SessionsState.loading());
    if (username == null) {
      emit(const SessionsState.fail("لم يتم العثور على المستخدم"));
      return;
    }
    final ApiResult<List<SessionModel>> result = await repo.getSessions(
      username,
    );
    result.when(
      success: (data) {
        sessions = data;
        emit(SessionsState.success(sessions));
      },
      failure: (error) {
        emit(const SessionsState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}

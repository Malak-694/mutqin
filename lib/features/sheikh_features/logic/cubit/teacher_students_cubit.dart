import 'package:bloc/bloc.dart';
import 'package:mutqin/core/di/dependency_injection.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';
import 'package:mutqin/features/sheikh_features/data/repo/sheikh_repo.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/teacher_students_state.dart';

class SheikhStudentsCubit extends Cubit<SheikhStudentsState> {
  SheikhRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();
  List<ProfileModel>? students;

  SheikhStudentsCubit(this.repo) : super(SheikhStudentsState.initial()) {
    getTutorStudents();
  }

  Future<void> getTutorStudents() async {
    emit(const SheikhStudentsState.loading());
    String? username = await prefs.getData(SharedPrefKey.username);
    if (username == null) {
      emit(SheikhStudentsState.fail('لا يوجد هذا المستخدم'));
    }

    final ApiResult<List<ProfileModel>> result = await repo.getTutorStudents(
      username!,
    );
    result.when(
      success: (data) {
        students = data;
        emit(SheikhStudentsState.success(students));
      },
      failure: (error) {
        emit(const SheikhStudentsState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}

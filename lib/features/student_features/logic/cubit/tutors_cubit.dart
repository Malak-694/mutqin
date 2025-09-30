import 'package:bloc/bloc.dart';
import 'package:mutqin/features/student_features/data/repo/student_repo.dart';
import 'package:mutqin/features/student_features/logic/cubit/tutors_state.dart';

import '../../../../core/networking/api_result.dart';
import '../../../profile/data/model/profile_model.dart';

class TutorsCubit extends Cubit<TutorsState> {
  StudentRepo repo;
  String? username;
  List<ProfileModel>? tutors;

  TutorsCubit(this.repo) : super(TutorsState.initial()) {
    getTutors();
  }
  Future<void> getTutors() async {
    emit(const TutorsState.loading());

    final ApiResult<List<ProfileModel>> result = await repo.getByRole("TUTOR");
    result.when(
      success: (data) {
        tutors = data;
        emit(TutorsState.success(tutors));
      },
      failure: (error) {
        emit(const TutorsState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}

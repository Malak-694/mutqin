import 'package:bloc/bloc.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/helper/shared_pref_helper.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/sheikh_features/data/model/calendy_model.dart';
import 'package:mutqin/features/sheikh_features/data/repo/sheikh_repo.dart';
import 'package:mutqin/features/sheikh_features/logic/cubit/sheikh_calendy_state.dart';

import '../../../../core/di/dependency_injection.dart';

class SheikhCalendyCubit extends Cubit<SheikhCalendyState> {
  SheikhRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();

  SheikhCalendyCubit(this.repo) : super(SheikhCalendyState.initial());

  Future<void> postCalendy(String link) async {
    emit(SheikhCalendyState.loading());
    String? username = await prefs.getData(SharedPrefKey.username);
    if (username == null) {
      emit(const SheikhCalendyState.fail("لم يتم العثور على المستخدم"));
      return;
    }
    CalendyModel body = CalendyModel(link: link);
    final ApiResult<CalendyResponseModel> result = await repo.postCalendy(
      username,
      body,
    );
    result.when(
      success: (data) {
        emit(SheikhCalendyState.success('تم رفع الرابط بنجاح'));
      },
      failure: (error) {
        emit(
          const SheikhCalendyState.fail(
            "توجد مشكلة بأضافة الرابط الرجاء المحاولة لاحقا",
          ),
        );
      },
    );
  }
}

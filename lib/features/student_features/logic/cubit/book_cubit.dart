import 'package:bloc/bloc.dart';
import 'package:mutqin/core/di/dependency_injection.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/student_features/logic/cubit/book_state.dart';
import 'package:mutqin/features/student_features/data/models/book_session.dart';
import 'package:mutqin/features/student_features/data/repo/student_repo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helper/shared_key.dart';
import '../../../../core/helper/shared_pref_helper.dart' show SharedPrefHelper;

class BookCubit extends Cubit<BookState> {
  StudentRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();
  BookCubit(this.repo) : super(BookState.initial());
  Future<void> bookSession(String tutorId) async {
    final userId = await prefs.getData(SharedPrefKey.id);

    emit(const BookState.loading());

    if (userId == null) {
      emit(const BookState.fail("لم يتم العثور على المستخدم"));
      return;
    }
    final int? s = int.tryParse(userId);
    final int? t = int.tryParse(tutorId);
    print("$s H $t");
    final body = BookRequestModel(studentId: s, tutorId: t);

    final ApiResult<BookResponseModel> result = await repo.bookSession(body);

    result.when(
      success: (data) async {
        final Uri uri = Uri.parse(data.scheduling_url ?? "");

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'رابط التسميع يوجد به مشكلة ';
        }
        emit(BookState.success(data.scheduling_url));
      },
      failure: (error) {
        emit(const BookState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }
}

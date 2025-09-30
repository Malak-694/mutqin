import 'package:bloc/bloc.dart';
import 'package:mutqin/core/helper/shared_key.dart';
import 'package:mutqin/core/networking/api_result.dart';
import 'package:mutqin/features/auth/data/model/user_model.dart';
import 'package:mutqin/features/profile/data/model/profile_model.dart';
import 'package:mutqin/features/profile/data/repo/profile_repo.dart';
import 'package:mutqin/features/profile/logic/cubit/profile_state.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helper/shared_pref_helper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepo repo;
  final SharedPrefHelper prefs = getIt<SharedPrefHelper>();
  User? user;
  ProfileModel? profile;
  String? token;
  ProfileCubit(this.repo) : super(ProfileState.initial()) {
    getProfile();
  }

  Future<void> getProfile() async {
    token = await prefs.getSecureData(SharedPrefKey.token);
    emit(const ProfileState.loading());

    if (token == null) {
      emit(const ProfileState.fail("غير مسموح برؤية التفاصيل"));
      return;
    }
    final ApiResult<User> result = await repo.getUserbyToken(token!);

    result.when(
      success: (data) {
        user = data;
        emit(ProfileState.success(data));
      },
      failure: (error) {
        emit(const ProfileState.fail("نحن نواجه مشكلة ونعمل على حلها"));
      },
    );
  }

  Future<void> updateProfile({
    String? age,
    String? username,
    String? phone,
  }) async {
    token = await prefs.getSecureData(SharedPrefKey.token);

    if (token == null) {
      emit(const ProfileState.fail("غير مسموح برؤية التفاصيل"));
      return;
    }

    // Update the local model first
    final Map<String, dynamic> body = {};
    if (age != null) body['age'] = age;
    if (username != null) body['username'] = username;
    if (phone != null) body['phone'] = phone;

    final ApiResult<ProfileModel> result = await repo.updateProfile(
      token!,
      body,
    );

    result.when(
      success: (data) {
        profile = data;
        emit(ProfileState.success("تم تعديل الخانات المطلوبة"));
      },
      failure: (error) {
        emit(const ProfileState.fail("نحن نواجه مشكلة ونعمل على حلها2"));
      },
    );
  }

  Future<void> deleteProfile() async {
    token = await prefs.getSecureData(SharedPrefKey.token);
    if (token == null) {
      emit(const ProfileState.fail("غير مسموح برؤية التفاصيل"));
      return;
    }
    final ApiResult<String> result = await repo.deleteProfile(token!);
    result.when(
      success: (data) {
        emit(ProfileState.success("تم مسح الحساب"));
        prefs.clearAll();
        prefs.clearAllSecure();
      },
      failure: (error) {
        emit(const ProfileState.fail("نحن نواجه مشكلة ونعمل على حلها3"));
      },
    );
  }
}

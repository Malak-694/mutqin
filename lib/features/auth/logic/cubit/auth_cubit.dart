import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutqin/core/helper/shared_key.dart';

import 'package:mutqin/features/auth/data/model/sign_up_model.dart';
import 'package:mutqin/features/auth/data/repo/auth_repo.dart';
import 'package:mutqin/features/auth/logic/cubit/auth_state.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/model/login_model.dart';
import '../../data/model/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
    final prefs = getIt<SharedPrefHelper>();

  AuthCubit(this.repo) : super(AuthState.initial());

  Future<void> signUp(
    String username,
    String email,
    String password,
    String phone,
    int age,
    String role,
  ) async {
    emit(const AuthState.loading());
    try {
      final request = SignUpRequest(
        username: username,
        email: email,
        password: password,
        phone: phone,
        age: age,
        role: role,
      );

      final ApiResult<SignUpResponse> result = await repo.signUp(request);
      result.when(
        success: (SignUpResponse response) async {
          emit(AuthState.success("${response.message} , You can now log in."));
        },
        failure: (error) {
          emit(AuthState.fail("please try again later"));
        },
      );
    } catch (e) {
      emit(AuthState.fail("please try again later"));
    }
  }

  Future<void> logIn(String email, String password) async {
    emit(const AuthState.loading());
    try {
      final request = LoginRequest(email: email, password: password);

      final ApiResult<LoginResponse> result = await repo.logIn(request);
      result.when(
        success: (LoginResponse response) async {
          await prefs.setSecureData(
            SharedPrefKey.token,
            response.token,
          );
          final ApiResult<User> userResult = await repo.getUserbyToken(response.token);
          userResult.when(
            success: (User user) async {
               await prefs.setData(
                SharedPrefKey.id,
                user.id,
              );
              await prefs.setData(
                SharedPrefKey.role,
                user.role,
              );
              emit(AuthState.success(user.role));
            },
            failure: (error) {
              emit(
                AuthState.fail(
                  "بالرجاء المحاولة لاحقا وتأكد من الايميل وكلمة المرور ",
                ),
              );
            },
          );
          
        },
        failure: (error) {
          emit(
            AuthState.fail(
              "بالرجاء المحاولة لاحقا وتأكد من الايميل وكلمة المرور ",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        AuthState.fail("بالرجاء المحاولة لاحقا وتأكد من الايميل وكلمة المرور "),
      );
    }
  }
}

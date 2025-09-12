import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    if (email == 'user@gmail.com' && password == 'password123') {
      emit(AuthSuccess('تسجيل الدخول بنجاح'));
    } else {
      emit(AuthFailure('Invalid username or password'));
    }
  }

  Future<void> register(
    String username,
    String password,
    String phone,
    String confirmPassword,
    String type,
  ) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    if (username.isNotEmpty && password.isNotEmpty) {
      emit(AuthSuccess('Registration Successful'));
    } else {
      emit(AuthFailure('Username and password cannot be empty'));
    }
  }
}

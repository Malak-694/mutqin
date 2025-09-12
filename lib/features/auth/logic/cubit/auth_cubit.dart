import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    if (username == 'user' && password == 'pass') {
      emit(AuthSuccess('Login Successful'));
    } else {
      emit(AuthFailure('Invalid username or password'));
    }
  }
  Future<void> register(String username, String password, String phone , String confirmPassword) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    if (username.isNotEmpty && password.isNotEmpty) {
      emit(AuthSuccess('Registration Successful'));
    } else {
      emit(AuthFailure('Username and password cannot be empty'));
    }
  }
}

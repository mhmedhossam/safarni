import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:safarni/core/services/local/shared_pref.dart';

import '../../domain/usecases/use_cases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registerUseCase,
    required this.verifyUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.forgotPasswordUseCase,
  }) : super(AuthInitial());
  final RegisterUseCase registerUseCase;
  final VerifyUseCase verifyUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  final ForgotPasswordUseCase forgotPasswordUseCase;
  bool x = false;
  bool y = false;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String conPassword,
  }) async {
    emit(AuthLoading());
    final data = await registerUseCase.call(
      name: name,
      email: email,
      password: password,
      passwordCon: conPassword,
    );

    data.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (data) => emit(AuthSuccess(message: data["message"])),
    );
  }

  Future<void> verify({required String email, required String code}) async {
    emit(AuthLoading());
    final data = await verifyUseCase.call(email: email, code: code);

    data.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (data) => emit(AuthSuccess(message: "email verified")),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final data = await loginUseCase.call(email: email, password: password);

    data.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (data) => emit(AuthSuccess(message: "Login successful")),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());

    final result = await logoutUseCase.call();

    result.fold(
      (failure) {
        emit(AuthFailure(message: failure.message));
      },
      (_) {
        SharedPref.delete(SharedPref.ktoken);
        emit(AuthSuccess(message: "log out succeed"));
      },
    );
  }

  void reset() {
    emit(AuthInitial());
  }

  void mustValidate(String? value) {
    if (value != null && value.length >= 8) {
      x = true;
      emit(AuthMustValSuccess());
    } else {
      x = false;
      emit(AuthMustValSuccess());
    }
    if (value != null && value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      y = true;
      emit(AuthMustValSuccess());
    } else {
      y = false;
      emit(AuthMustValSuccess());
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());

    final result = await forgotPasswordUseCase.call(email);

    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (message) => emit(AuthSuccess(message: message)),
    );
  }
}

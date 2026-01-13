import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/use_cases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registerUseCase,
    required this.verfiyUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.forgotPasswordUseCase,
  }) : super(AuthInitial());
  final RegisterUseCase registerUseCase;
  final VerfiyUseCase verfiyUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

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
      passwordcon: conPassword,
    );

    data.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (data) => emit(AuthSuccess(message: data["message"])),
    );
  }

  Future<void> verfiy({required String email, required String code}) async {
    emit(AuthLoading());
    final data = await verfiyUseCase.call(email: email, code: code);

    data.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (data) => emit(AuthSuccess(message: "email verfied")),
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
    log('🎬 Cubit: Logout called');
    emit(AuthLoading());

    final result = await logoutUseCase.call();

    result.fold(
      (failure) {
        log('❌ Cubit: Logout failure - ${failure.message}');
        emit(AuthFailure(message: failure.message));
      },
      (_) {
        log('✅ Cubit: Logout success');
        emit(AuthInitial());
      },
    );
  }

  void reset() {
    log('🔄 Cubit: Reset to initial state');
    emit(AuthInitial());
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

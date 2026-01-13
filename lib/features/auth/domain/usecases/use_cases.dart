import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/auth/domain/entity/entities.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

//===================>Reqister
class RegisterUseCase {
  final AuthRepo repo;

  RegisterUseCase({required this.repo});

  Future<Either<Failure, Map>> call({
    required String name,
    required String email,
    required String password,
    required String passwordcon,
  }) {
    return repo.register(
      name: name,
      email: email,
      password: password,
      passwordcon: passwordcon,
    );
  }
}

//===================>login
class LoginUseCase {
  final AuthRepo repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, AuthEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}

//==================>verfiy
class VerfiyUseCase {
  final AuthRepo repo;

  VerfiyUseCase({required this.repo});

  Future<Either<Failure, void>> call({
    required String email,
    required String code,
  }) {
    return repo.verfiy(email: email, code: code);
  }
}

class LogoutUseCase {
  final AuthRepo repo;

  LogoutUseCase({required this.repo});

  Future<Either<Failure, void>> call() {
    return repo.logout();
  }
}

class ForgotPasswordUseCase {
  final AuthRepo repo;

  ForgotPasswordUseCase(this.repo);

  Future<Either<Failure, String>> call(String email) {
    return repo.forgotPassword(email: email);
  }
}

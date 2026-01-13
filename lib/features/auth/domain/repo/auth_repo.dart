import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/domain/entity/entities.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map>> register({
    required String name,
    required String email,
    required String password,
    required String passwordcon,
  });

  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> verfiy({
    required String email,
    required String code,
  });

  Future<Either<Failure, String>> forgotPassword({required String email});

  Future<Either<Failure, void>> logout();

  bool isLoggedIn();
  Object? getToken();
}

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/core/models/base_model.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/data/model/models.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/data/remote/remote_data_source.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/domain/entity/entities.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/services/local/shared_pref.dart';

class AuthRepoImpl extends AuthRepo {
  final RemoteDataSource remote;
  // final SharedPref local;

  AuthRepoImpl({required this.remote});
  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remote.login(email: email, password: password);

      final baseModel = BaseModel<AuthModel>.fromJson(
        response,
        (json) => AuthModel.fromJson(json as Map<String, dynamic>),
      );

      if (baseModel.success == true && baseModel.data != null) {
        await SharedPref.setData(SharedPref.ktoken, baseModel.data!.token);

        return Right(baseModel.data!); // ✅ AuthModel extends AuthEntity
      }

      return Left(ServerFailure(baseModel.message ?? 'Login failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  //===============================>register
  @override
  Future<Either<Failure, Map>> register({
    required String name,
    required String email,
    required String password,
    required String passwordcon,
  }) async {
    try {
      final response = await remote.register(
        name: name,
        email: email,
        password: password,
        passwordCon: passwordcon,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> verfiy({
    required String email,
    required String code,
  }) async {
    try {
      final response = await remote.verfiy(email: email, code: code);
      final basemodel = BaseModel<void>.fromJson(response, null);

      if (basemodel.success!) {
        return const Right(null);
      } else {
        return Left(ServerFailure(basemodel.message!));
      }
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      log('🔵 Repo: Logging out');

      // Clear token from SharedPreferences
      await SharedPref.delete(SharedPref.ktoken);

      log('✅ Logout successful');
      return const Right(null);
    } catch (e) {
      log('❌ Logout error: $e');
      return Left(ServerFailure('Logout failed: $e'));
    }
  }

  // ✅ Add method to check if user is logged in
  @override
  bool isLoggedIn() {
    final token = SharedPref.getData(SharedPref.ktoken);
    return token != null && token.toString().isNotEmpty;
  }

  // ✅ Add method to get current token
  @override
  Object? getToken() {
    return SharedPref.getData(SharedPref.ktoken);
  }

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await remote.forgetPassword(email: email);

      final baseModel = BaseModel<void>.fromJson(response, null);

      return Right(baseModel.message!);
    } catch (e) {
      return Left(
        ServerFailure('Something went wrong, please try again later'),
      );
    }
  }
}

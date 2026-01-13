import 'package:safarni/core/error/error_handler.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/core/services/api/network/dio_provider.dart';
import 'package:safarni/core/services/api/network/main_endpoint.dart';
import 'package:safarni/features/auth/data/remote/remote_data_source.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  //===============================>login
  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioProvider.post(
        MainEndpoint.login,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw ServerFailure(response.data?['message'] ?? 'Login failed');
      }
    } on Exception catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  //================================>register
  @override
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordCon,
  }) async {
    try {
      final response = await DioProvider.post(
        MainEndpoint.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          "password_confirmation": passwordCon,
        },
      );
      if (response.statusCode == 201) {
        return response.data!;
      } else {
        throw ServerFailure(
          response.data?['message'] ?? "registeration failed",
        );
      }
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  //=====================================verfiy
  @override
  Future<Map<String, dynamic>> verfiy({
    required String email,
    required String code,
  }) async {
    try {
      final response = await DioProvider.post(
        MainEndpoint.verfiy,
        data: {'email': email, 'code': code},
      );
      if (response.statusCode == 200) {
        return response.data!;
      } else {
        throw ServerFailure(response.data?['message'] ?? 'Verification failed');
      }
    } on Exception catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) async {
    final response = await DioProvider.post(
      MainEndpoint.forgotPassword,
      data: {'email': email},
    );

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw ServerFailure('Failed to send reset code');
  }
}

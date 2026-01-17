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
        headres: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      return response.data!;
    } catch (e) {
      throw ErrorHandler.handle(e);
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
        headres: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      return response.data!;
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
        headres: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      return response.data!;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) async {
    try {
      final response = await DioProvider.post(
        MainEndpoint.forgotPassword,
        data: {'email': email},
        headres: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      return response.data!;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}

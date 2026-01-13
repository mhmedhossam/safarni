import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/api/network/main_endpoint.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../model/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;
  final SharedPreferences prefs;

  ProfileRemoteDataSourceImpl({required this.dio, required this.prefs});

  @override
  Future<UserProfileModel> getProfile() async {
    final token = prefs.getString('token') ?? '';
    try {
      final response = await dio.get(
        MainEndpoint.user,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return UserProfileModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch profile');
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }
}

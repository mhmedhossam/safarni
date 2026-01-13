abstract class RemoteDataSource {
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordCon,
  });

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> forgetPassword({required String email});

  Future<Map<String, dynamic>> verfiy({
    required String email,
    required String code,
  });
}

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? location;
  final String? profileImage;
  final String role;
  final bool isVerified;
  final DateTime createdAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.profileImage,
    required this.role,
    required this.isVerified,
    required this.createdAt,
  });
}

class AuthEntity {
  final String token;
  final UserEntity user;

  AuthEntity({required this.token, required this.user});
}

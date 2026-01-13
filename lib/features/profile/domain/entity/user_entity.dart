class UserProfileEntity {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? profileImage;
  final bool isVerified;
  final String role;
  final String status;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.location,
    this.latitude,
    this.longitude,
    this.profileImage,
    required this.isVerified,
    required this.role,
    required this.status,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}

import '../../domain/entity/user_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.name,
    required super.email,
    super.phone,
    super.location,
    super.latitude,
    super.longitude,
    super.profileImage,
    required super.isVerified,
    required super.role,
    required super.status,
    required super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
      latitude: json['latitude'] != null
          ? double.parse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.parse(json['longitude'].toString())
          : null,
      profileImage: json['profile_image'],
      isVerified: json['is_verified'],
      role: json['role'],
      status: json['status'],
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'profile_image': profileImage,
      'is_verified': isVerified,
      'role': role,
      'status': status,
      'email_verified_at': emailVerifiedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic phone;
  dynamic location;
  dynamic latitude;
  dynamic longitude;
  dynamic profileImage;
  bool? isVerified;
  String? role;
  String? status;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.isVerified,
    this.role,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as dynamic,
    location: json['location'] as dynamic,
    latitude: json['latitude'] as dynamic,
    longitude: json['longitude'] as dynamic,
    profileImage: json['profile_image'] as dynamic,
    isVerified: json['is_verified'] as bool?,
    role: json['role'] as String?,
    status: json['status'] as String?,
    emailVerifiedAt: json['email_verified_at'] == null
        ? null
        : DateTime.parse(json['email_verified_at'] as String),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
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
    'email_verified_at': emailVerifiedAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_at': deletedAt,
  };
}

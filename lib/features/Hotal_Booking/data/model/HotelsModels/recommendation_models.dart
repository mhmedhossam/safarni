class HotelsModels {
  int? id;
  String? name;
  String? description;
  String? address;
  String? city;
  String? latitude;
  String? longitude;
  String? rating;
  String? mainImage;
  int? discount;
  DateTime? createdAt;
  DateTime? updatedAt;

  HotelsModels({
    this.id,
    this.name,
    this.description,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.rating,
    this.mainImage,
    this.discount,
    this.createdAt,
    this.updatedAt,
  });

  factory HotelsModels.fromJson(Map<String, dynamic> json) {
    return HotelsModels(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      rating: json['rating'] as String?,
      mainImage: json['main_image'] as String?,
      discount: json['discount'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'address': address,
    'city': city,
    'latitude': latitude,
    'longitude': longitude,
    'rating': rating,
    'main_image': mainImage,
    'discount': discount,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}

class RoomsModels {
  int? id;
  int? hotelId;
  String? name;
  dynamic mainImage;
  int? pricePerNight;
  int? occupancy;
  String? bedType;
  dynamic area;
  int? bathrooms;
  DateTime? createdAt;
  DateTime? updatedAt;

  RoomsModels({
    this.id,
    this.hotelId,
    this.name,
    this.mainImage,
    this.pricePerNight,
    this.occupancy,
    this.bedType,
    this.area,
    this.bathrooms,
    this.createdAt,
    this.updatedAt,
  });

  factory RoomsModels.fromJson(Map<String, dynamic> json) => RoomsModels(
    id: json['id'] as int?,
    hotelId: json['hotel_id'] as int?,
    name: json['name'] as String?,
    mainImage: json['main_image'] as dynamic,
    pricePerNight: json['price_per_night'] as int?,
    occupancy: json['occupancy'] as int?,
    bedType: json['bed_type'] as String?,
    area: json['area'] as dynamic,
    bathrooms: json['bathrooms'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'hotel_id': hotelId,
    'name': name,
    'main_image': mainImage,
    'price_per_night': pricePerNight,
    'occupancy': occupancy,
    'bed_type': bedType,
    'area': area,
    'bathrooms': bathrooms,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}

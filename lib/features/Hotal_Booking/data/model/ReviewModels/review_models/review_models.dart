import 'user.dart';

class ReviewModels {
  int? id;
  int? userId;
  String? category;
  int? itemId;
  dynamic title;
  String? comment;
  int? rating;
  List<dynamic>? photosJson;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  ReviewModels({
    this.id,
    this.userId,
    this.category,
    this.itemId,
    this.title,
    this.comment,
    this.rating,
    this.photosJson,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ReviewModels.fromJson(Map<String, dynamic> json) => ReviewModels(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    category: json['category'] as String?,
    itemId: json['item_id'] as int?,
    title: json['title'] as dynamic,
    comment: json['comment'] as String?,
    rating: json['rating'] as int?,
    photosJson: json['photos_json'] as List<dynamic>?,
    status: json['status'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'category': category,
    'item_id': itemId,
    'title': title,
    'comment': comment,
    'rating': rating,
    'photos_json': photosJson,
    'status': status,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'user': user?.toJson(),
  };
}

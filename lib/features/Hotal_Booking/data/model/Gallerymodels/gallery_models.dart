class GalleryModels {
  int? id;
  String? url;
  String? user;
  DateTime? createdAt;

  GalleryModels({this.id, this.url, this.user, this.createdAt});

  factory GalleryModels.fromJson(Map<String, dynamic> json) => GalleryModels(
    id: json['id'] as int?,
    url: json['url'] as String?,
    user: json['user'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'user': user,
    'created_at': createdAt?.toIso8601String(),
  };
}

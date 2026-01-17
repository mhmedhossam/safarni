import 'package:safarni/features/Home/domain/entities/category_entitiy.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.iconUrl,
    required super.id,
    required super.name,
    required super.slug,
  });

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      iconUrl: json["icon_url"] as String?,
      id: json["id"] as int?,
      name: json["name"] as String?,
      slug: json["slug"] as String?,
    );
  }
}

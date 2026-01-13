import 'package:round_8_mobile_safarni_team3/features/Home/domain/entities/category_entitiy.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.iconUrl,
    required super.id,
    required super.name,
    required super.slug,
  });

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      iconUrl: json["icon_url"],
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
    );
  }
}

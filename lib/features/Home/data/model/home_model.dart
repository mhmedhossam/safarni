import 'package:round_8_mobile_safarni_team3/features/Home/data/model/category_model.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/data/model/recommendation_model.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/domain/entities/home_entitiy.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.categories,
    required super.recommendations,
    required super.tours,
  });

  factory HomeModel.fromJson(json) {
    return HomeModel(
      categories: (json["categories"] as List<dynamic>).map((e) {
        return CategoryModel.fromJson(e as Map<String, dynamic>);
      }).toList(),
      recommendations: (json["tours"] as List<dynamic>).map((e) {
        return RecommendationModel.fromJson(e as Map<String, dynamic>);
      }).toList(),
      tours: json["tours"],
    );
  }
}

import 'package:safarni/features/Home/data/model/category_model.dart';
import 'package:safarni/features/Home/data/model/recommendation_model.dart';
import 'package:safarni/features/Home/domain/entities/home_entitiy.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.categories,
    required super.recommendations,
    required super.tours,
  });

  factory HomeModel.fromJson(dynamic json) {
    print("hamadarrrrr"); //----
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

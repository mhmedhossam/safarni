import 'package:safarni/features/Home/domain/entities/category_entitiy.dart';
import 'package:safarni/features/Home/domain/entities/recommendation_entity.dart';

class HomeEntity {
  List<CategoryEntity> categories;

  List<RecommendationEntity> recommendations;
  List<dynamic> tours;
  HomeEntity({
    required this.categories,
    required this.recommendations,
    required this.tours,
  });
}

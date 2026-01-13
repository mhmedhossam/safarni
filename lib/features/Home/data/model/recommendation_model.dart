import 'package:safarni/features/Home/domain/entities/recommendation_entity.dart';
import 'package:safarni/features/Home/data/model/price_model.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
    super.endDate,
    super.id,
    super.isFeatured,
    super.location,
    super.price,
    super.rating,
    super.slug,
    super.startDate,
    super.thumbnail,
    super.title,
  });

  factory RecommendationModel.fromJson(dynamic json) {
    return RecommendationModel(
      endDate: json["end_date"],
      id: json["id"],
      isFeatured: json["is_featured"],
      location: json["location"],
      price: PriceModel.fromJson(json["price"]),
      rating: json["rating"],
      slug: json["slug"],
      startDate: json["start_date"],
      thumbnail: json["thumbnail"],
      title: json["title"],
    );
  }
}

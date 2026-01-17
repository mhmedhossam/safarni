import 'package:safarni/features/Home/domain/entities/price_entity.dart';

class RecommendationEntity {
  final int? id;
  final String? title;
  final String? slug;
  final String? location;
  final String? startDate;
  final PriceEntity? price;
  final String? endDate;
  final dynamic rating;
  final String? thumbnail;
  final bool? isFeatured;
  const RecommendationEntity({
    this.id,
    this.title,
    this.price,
    this.endDate,
    this.isFeatured,
    this.location,
    this.rating,
    this.slug,
    this.startDate,
    this.thumbnail,
  });
}

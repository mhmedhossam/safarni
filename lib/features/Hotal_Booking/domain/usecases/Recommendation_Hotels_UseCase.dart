import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Recommendation_Hotels_Repos.dart';

class RecommendationHotelsUsecase {
  final RecommendationHotelsRepos recommendationHotelsRepos;

  RecommendationHotelsUsecase(this.recommendationHotelsRepos);

  Future<Either<Failure, List<HotelsModels>>> call() async {
    return await recommendationHotelsRepos.FetchRecommendationHotels();
  }
}

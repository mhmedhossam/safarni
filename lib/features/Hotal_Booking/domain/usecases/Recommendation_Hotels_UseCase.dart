import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Recommendation_Hotels_Repos.dart';

class RecommendationHotelsUsecase {
  final RecommendationHotelsRepos recommendationHotelsRepos;

  RecommendationHotelsUsecase(this.recommendationHotelsRepos);

  Future<Either<Failure, List<HotelsModels>>> call() async {
    return await recommendationHotelsRepos.FetchRecommendationHotels();
  }
}

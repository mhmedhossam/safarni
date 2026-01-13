import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/remote/RecommendationHotelsRemoteSource.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Recommendation_Hotels_Repos.dart';

class RecommendationHotelsRepoImpl extends RecommendationHotelsRepos {
  final Recommendationhotelsremotesource recommendationhotelsremotesource;
  RecommendationHotelsRepoImpl(this.recommendationhotelsremotesource);

  @override
  Future<Either<Failure, List<HotelsModels>>>
  FetchRecommendationHotels() async {
    try {
      final response = await recommendationhotelsremotesource
          .fetchRecommendationHotels();
      return right(response);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure('Server Error'));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Hotels_Seach_RemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/hotels_Search_Repos.dart';

class HotelsSearchRepoImpl extends HotelsSearchRepos {
  final HotelsSearchRemoteSource hotelsSearchRemoteSource;
  HotelsSearchRepoImpl(this.hotelsSearchRemoteSource);

  @override
  Future<Either<Failure, List<HotelsModels>>> FetchSearchHotels({
    required String cityName,
    int? guests,
  }) async {
    try {
      var response = await hotelsSearchRemoteSource.fetchSearchHotels(
        cityName: cityName,
        guests: guests,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}

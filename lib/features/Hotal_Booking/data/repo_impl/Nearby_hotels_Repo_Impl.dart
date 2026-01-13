import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Nearby_HotelsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Nearby_Hotels_Repos.dart';

class NearbyHotelsRepoImpl extends NearbyHotelsRepos {
  final NearbyHotelsRemoteSource nearbyHotelsRemoteSource;
  NearbyHotelsRepoImpl(this.nearbyHotelsRemoteSource);

  @override
  Future<Either<Failure, List<HotelsModels>>> FetchNearbyHotels() async {
    try {
      final response = await nearbyHotelsRemoteSource.fetchNearbyHotels();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}

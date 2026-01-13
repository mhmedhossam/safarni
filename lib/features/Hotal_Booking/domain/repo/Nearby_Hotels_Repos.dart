import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';

abstract class NearbyHotelsRepos {
  Future<Either<Failure, List<HotelsModels>>> FetchNearbyHotels();
}

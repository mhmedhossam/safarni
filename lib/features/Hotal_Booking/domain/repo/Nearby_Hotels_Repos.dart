import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';

abstract class NearbyHotelsRepos {
  Future<Either<Failure, List<HotelsModels>>> FetchNearbyHotels();
}

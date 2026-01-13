import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';

abstract class HotelsRoomRepos {
  Future<Either<Failure, List<RoomsModels>>> fetchHotelsRooms({
    required int hotelId,
  });
}

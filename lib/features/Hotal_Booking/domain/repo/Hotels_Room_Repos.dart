import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Roos/rooms_models.dart';

abstract class HotelsRoomRepos {
  Future<Either<Failure, List<RoomsModels>>> fetchHotelsRooms({
    required int hotelId,
  });
}

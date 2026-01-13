import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Roos/rooms_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Hotels_Room_Repos.dart';

class HotelsRoomUsecase {
  final HotelsRoomRepos hotelsRoomRepos;

  HotelsRoomUsecase(this.hotelsRoomRepos);

  Future<Either<Failure, List<RoomsModels>>> call({
    required int hotelId,
  }) async {
    return await hotelsRoomRepos.fetchHotelsRooms(hotelId: hotelId);
  }
}

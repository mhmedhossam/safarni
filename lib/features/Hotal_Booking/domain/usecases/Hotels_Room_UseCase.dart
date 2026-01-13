import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Hotels_Room_Repos.dart';

class HotelsRoomUsecase {
  final HotelsRoomRepos hotelsRoomRepos;

  HotelsRoomUsecase(this.hotelsRoomRepos);

  Future<Either<Failure, List<RoomsModels>>> call({
    required int hotelId,
  }) async {
    return await hotelsRoomRepos.fetchHotelsRooms(hotelId: hotelId);
  }
}

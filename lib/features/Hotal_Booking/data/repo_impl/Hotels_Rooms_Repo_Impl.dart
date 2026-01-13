import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Roos/rooms_models.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Hotels_RoomsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Hotels_Room_Repos.dart';

class HotelsRoomsRepoImpl extends HotelsRoomRepos {
  final HotelsRoomsremotesource hotelsRoomsRemoteSource;
  HotelsRoomsRepoImpl(this.hotelsRoomsRemoteSource);

  @override
  Future<Either<Failure, List<RoomsModels>>> fetchHotelsRooms({
    required int hotelId,
  }) async {
    try {
      final response = await hotelsRoomsRemoteSource.fetchHotelsRooms(
        hotelId: hotelId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}

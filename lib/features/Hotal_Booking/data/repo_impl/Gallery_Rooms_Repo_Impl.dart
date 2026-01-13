import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/remote/Gallery_RoomsRemoteSource.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/remote/Hotels_RoomsRemoteSource.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Gallery_Room_Repos.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Hotels_Room_Repos.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/hotels_Search_Repos.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/manager/GalleryRoomCubit/gallery_room_cubit.dart';

class GalleryRoomsRepoImpl extends GalleryRoomRepos {
  final GalleryRoomsremotesource galleryRoomsremotesource;
  GalleryRoomsRepoImpl(this.galleryRoomsremotesource);

  @override
  Future<Either<Failure, List<GalleryModels>>> fetchGalleryRooms({
    required int hotelId,
  }) async {
    try {
      final response = await galleryRoomsremotesource.fetchGalleryRooms(
        hotelId: hotelId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Gallery_RoomsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Gallery_Room_Repos.dart';

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

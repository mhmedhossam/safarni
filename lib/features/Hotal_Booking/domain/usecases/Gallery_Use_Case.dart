import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Gallery_Room_Repos.dart';

class GalleryUseCase {
  final GalleryRoomRepos galleryRoomRepos;

  GalleryUseCase(this.galleryRoomRepos);

  Future<Either<Failure, List<GalleryModels>>> call({
    required int hotelId,
  }) async {
    return await galleryRoomRepos.fetchGalleryRooms(hotelId: hotelId);
  }
}

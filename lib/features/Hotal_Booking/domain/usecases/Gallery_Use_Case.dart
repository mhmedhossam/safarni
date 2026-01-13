import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Gallery_Room_Repos.dart';

class GalleryUseCase {
  final GalleryRoomRepos galleryRoomRepos;

  GalleryUseCase(this.galleryRoomRepos);

  Future<Either<Failure, List<GalleryModels>>> call({
    required int hotelId,
  }) async {
    return await galleryRoomRepos.fetchGalleryRooms(hotelId: hotelId);
  }
}

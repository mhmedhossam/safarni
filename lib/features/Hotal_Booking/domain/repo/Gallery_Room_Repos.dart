import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';

abstract class GalleryRoomRepos {
  Future<Either<Failure, List<GalleryModels>>> fetchGalleryRooms({
    required int hotelId,
  });
}

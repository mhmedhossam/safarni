import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';

abstract class ReviewRoomRepos {
  Future<Either<Failure, List<ReviewModels>>> fetchReviewRoom({
    required int hotelId,
  });
}

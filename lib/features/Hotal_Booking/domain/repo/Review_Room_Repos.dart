import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';

abstract class ReviewRoomRepos {
  Future<Either<Failure, List<ReviewModels>>> fetchReviewRoom({
    required int hotelId,
  });
}

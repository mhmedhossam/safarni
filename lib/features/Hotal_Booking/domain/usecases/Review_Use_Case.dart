import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/Review_Room_Repos.dart';

class ReviewUseCase {
  final ReviewRoomRepos reviewRoomRepos;

  ReviewUseCase(this.reviewRoomRepos);

  Future<Either<Failure, List<ReviewModels>>> call({
    required int hotelId,
  }) async {
    return await reviewRoomRepos.fetchReviewRoom(hotelId: hotelId);
  }
}

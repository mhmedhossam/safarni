import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Review_Room_Repos.dart';

class ReviewUseCase {
  final ReviewRoomRepos reviewRoomRepos;

  ReviewUseCase(this.reviewRoomRepos);

 Future<Either<Failure, List<ReviewModels>>>  call({
    required int hotelId,
  }) async {
    return await reviewRoomRepos.fetchReviewRoom(hotelId: hotelId);
  }
}

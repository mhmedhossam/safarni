import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/remote/Review_RoomsRemoteSource.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/repo/Review_Room_Repos.dart';

class ReviewRoomsRepoImpl extends ReviewRoomRepos {
  final ReviewRoomsremotesource reviewRoomsremotesource;
  ReviewRoomsRepoImpl(this.reviewRoomsremotesource);


  @override
  Future<Either<Failure, List<ReviewModels>>> fetchReviewRoom({required int hotelId}) async{
     try {
      final response = await  reviewRoomsremotesource.fetchReviewRooms(
        hotelId: hotelId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}

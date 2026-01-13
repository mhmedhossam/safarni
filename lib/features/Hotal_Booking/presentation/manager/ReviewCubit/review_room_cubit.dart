import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Review_Use_Case.dart';

part 'review_room_state.dart';

class ReviewRoomCubit extends Cubit<ReviewRoomState> {
  ReviewRoomCubit(this.reviewUseCase) : super(ReviewRoomInitial());
  ReviewUseCase reviewUseCase;
  void fetchReviewRoom({required int hotelId}) async {
    emit(ReviewRoomLoading());
    final result = await reviewUseCase.call(hotelId: hotelId);
    result.fold(
      (failure) {
        emit(ReviewRoomFailure(failure.message));
      },
      (review) {
        emit(ReviewRoomSuccess(review));
      },
    );
  }
}

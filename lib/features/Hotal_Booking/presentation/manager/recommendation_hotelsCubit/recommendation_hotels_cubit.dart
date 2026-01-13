import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Recommendation_Hotels_UseCase.dart';

part 'recommendation_hotels_state.dart';

class RecommendationHotelsCubit extends Cubit<RecommendationHotelsState> {
  RecommendationHotelsCubit(this.recommendationHotelsUsecase)
    : super(RecommendationHotelsInitial());
  RecommendationHotelsUsecase recommendationHotelsUsecase;
  fetchRecommendationHotels() async {
    emit(RecommendationHotelsLoading());
    final result = await recommendationHotelsUsecase.call();
    result.fold(
      (failure) {
        emit(RecommendationHotelsFailure(failure.message));
      },
      (hotels) {
        emit(RecommendationHotelsSuccess(hotels));
      },
    );
  }
}

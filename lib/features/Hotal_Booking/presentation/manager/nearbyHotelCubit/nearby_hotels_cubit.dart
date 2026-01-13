import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Nearby_Hotels_Use_Case.dart';

part 'nearby_hotels_state.dart';

class NearbyHotelsCubit extends Cubit<NearbyHotelsState> {
  NearbyHotelsCubit(this.nearbyHotelsUsecase) : super(NearbyHotelsInitial());
  final NearbyHotelsUseCase nearbyHotelsUsecase;
  fetchNearbyHotels() async {
    emit(NearbyHotelsLoading());
    final result = await nearbyHotelsUsecase.call();
    result.fold(
      (failure) {
        emit(NearbyHotelsFailure(failure.message));
      },
      (hotels) {
        emit(NearbyHotelsSuccess(hotels));
      },
    );
  }
}

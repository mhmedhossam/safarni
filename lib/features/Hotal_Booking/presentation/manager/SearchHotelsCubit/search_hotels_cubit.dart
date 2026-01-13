import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Hotels_Search_UseCase.dart';

part 'search_hotels_state.dart';

class SearchHotelsCubit extends Cubit<SearchHotelsState> {
  SearchHotelsCubit(this.hotelsSearchUsecase) : super(SearchHotelsInitial());
  final HotelsSearchUsecase hotelsSearchUsecase;
  fetchSearchHotels({required String city}) async {
    emit(SearchHotelsLoading());
    final result = await hotelsSearchUsecase.call(cityName: city);
    result.fold(
      (failure) {
        emit(SearchHotelsFailure(message: failure.message));
      },
      (hotels) {
        emit(SearchHotelsLoaded(hotels: hotels));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Hotels_Room_UseCase.dart';

part 'hotels_rooms_state.dart';

class HotelsRoomsCubit extends Cubit<HotelsRoomsState> {
  HotelsRoomsCubit(this.nearbyHotelsUsecase) : super(HotelsRoomsInitial());
  final HotelsRoomUsecase nearbyHotelsUsecase;
  fetchRoomsHotels({required int hotelId}) async {
    emit(HotelsRoomsLoading());
    final result = await nearbyHotelsUsecase.call(hotelId: hotelId);
    result.fold(
      (failure) {
        emit(HotelsRoomsFailure(failure.message));
      },
      (rooms) {
        emit(HotelsRoomsSuccess(rooms));
      },
    );
  }
}

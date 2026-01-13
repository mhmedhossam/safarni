import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Gallery_Use_Case.dart';

part 'gallery_room_state.dart';

class GalleryRoomCubit extends Cubit<GalleryRoomState> {
  GalleryRoomCubit(this.galleryUseCase) : super(GalleryRoomInitial());
  GalleryUseCase galleryUseCase;
  void fetchGalleryRooms({required int hotelId}) async {
    emit(GalleryRoomLoading());
    final result = await galleryUseCase.call(hotelId: hotelId);
    result.fold(
      (failure) {
        emit(GalleryRoomFailure(failure.message));
      },
      (galleryRooms) {
        emit(GalleryRoomSuccess(galleryRooms));
      },
    );
  }
}

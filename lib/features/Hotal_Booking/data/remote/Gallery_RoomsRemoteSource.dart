import 'package:safarni/core/services/api/network/dio_provider.dart';
import 'package:safarni/core/services/api/network/main_endpoint.dart';
import 'package:safarni/core/services/local/shared_pref.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Gallerymodels/gallery_models.dart';

abstract class GalleryRoomsremotesource {
  Future<List<GalleryModels>> fetchGalleryRooms({required int hotelId});
}

class GalleryRoomsRemoteSourceImpl extends GalleryRoomsremotesource {
  @override
  Future<List<GalleryModels>> fetchGalleryRooms({required int hotelId}) async {
    //log("////response.statusCode.toString()");
    // var response = await DioProvider.get(MainEndpoint.home);
    var token = SharedPref.getData('token') ?? '';

    var response = await DioProvider.get(
      "${MainEndpoint.hotelsRooms}$hotelId/gallery",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer $token', //21|FTOir1CRkQGr4ltvLoRuyodhqMdTSo8dgD0W1vs528d041cf', // لو موجود
      },
    );
    //print(response.statusCode);
    //log("////response.statusCode.toString()");
    List<GalleryModels> galleryHotels = [];
    for (var hotel in response.data!['data']) {
      galleryHotels.add(GalleryModels.fromJson(hotel));
    }
    //print(galleryHotels);
    return galleryHotels;
  }
}

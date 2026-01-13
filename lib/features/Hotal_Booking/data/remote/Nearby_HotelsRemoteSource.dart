import 'package:safarni/core/services/api/network/dio_provider.dart';
import 'package:safarni/core/services/api/network/main_endpoint.dart';
import 'package:safarni/core/services/local/shared_pref.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';

abstract class NearbyHotelsRemoteSource {
  Future<List<HotelsModels>> fetchNearbyHotels();
}

class NearbyHotelsRemoteSourceImpl extends NearbyHotelsRemoteSource {
  @override
  Future<List<HotelsModels>> fetchNearbyHotels() async {
    //log("////respons before getting data");
    // var response = await DioProvider.get(MainEndpoint.home);
    var token = SharedPref.getData('token') ?? '';

    var response = await DioProvider.get(
      MainEndpoint.hotelsNearby,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer $token', //21|FTOir1CRkQGr4ltvLoRuyodhqMdTSo8dgD0W1vs528d041cf', // لو موجود
      },
    );
    //print(response.statusCode);
    //print(response.data);
    //log("////response after getting data");
    List<HotelsModels> nearbyHotels = [];
    for (var hotel in response.data!['data']) {
      nearbyHotels.add(HotelsModels.fromJson(hotel));
    }
    //print(nearbyHotels);
    return nearbyHotels;
  }
}

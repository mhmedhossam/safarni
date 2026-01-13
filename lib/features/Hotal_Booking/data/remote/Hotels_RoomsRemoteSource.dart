import 'dart:developer';

import 'package:round_8_mobile_safarni_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/main_endpoint.dart';
import 'package:round_8_mobile_safarni_team3/core/services/local/shared_pref.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';

abstract class HotelsRoomsremotesource {
  Future<List<RoomsModels>> fetchHotelsRooms({required int hotelId});
}

class HotelsRoomsRemoteSourceImpl extends HotelsRoomsremotesource {
  @override
  Future<List<RoomsModels>> fetchHotelsRooms({required int hotelId}) async {
    log("////response.statusCode.toString()");
    // var response = await DioProvider.get(MainEndpoint.home);
     var token = SharedPref.getData('token') ?? '';

    var response = await DioProvider.get(
      "${MainEndpoint.hotelsRooms}$hotelId/rooms",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer $token',//21|FTOir1CRkQGr4ltvLoRuyodhqMdTSo8dgD0W1vs528d041cf', // لو موجود
      },
    );
    print(response.statusCode);
    log("////response.statusCode.toString()");
    List<RoomsModels> recommendationHotels = [];
    for (var hotel in response.data!['data']) {
      recommendationHotels.add(RoomsModels.fromJson(hotel));
    }
    print(recommendationHotels);
    return recommendationHotels;
  }
}

import 'dart:developer';

import 'package:round_8_mobile_safarni_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/main_endpoint.dart';
import 'package:round_8_mobile_safarni_team3/core/services/local/shared_pref.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/ReviewModels/review_models/review_models.dart';

abstract class ReviewRoomsremotesource {
  Future<List<ReviewModels>> fetchReviewRooms({required int hotelId});
}

class ReviewRoomsRemoteSourceImpl extends ReviewRoomsremotesource {
  @override
  Future<List<ReviewModels>> fetchReviewRooms({required int hotelId}) async {
    log("////response.statusCode.toString()");
    // var response = await DioProvider.get(MainEndpoint.home);
     var token = SharedPref.getData('token') ?? '';

    var response = await DioProvider.get(
      "${MainEndpoint.hotelsRooms}$hotelId/reviews",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer $token',//21|FTOir1CRkQGr4ltvLoRuyodhqMdTSo8dgD0W1vs528d041cf', // لو موجود
      },
    );
    print(response.statusCode);
    log("////response.statusCode.toString()");
    List<ReviewModels> ReviewHotels = [];
    for (var hotel in response.data!['data']['data']) {
      ReviewHotels.add(ReviewModels.fromJson(hotel));
    }
    print(ReviewHotels);
    return ReviewHotels;
  }
}

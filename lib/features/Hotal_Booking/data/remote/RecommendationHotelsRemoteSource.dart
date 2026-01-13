import 'dart:developer';

import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/main_endpoint.dart';
import 'package:round_8_mobile_safarni_team3/core/services/local/shared_pref.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';

abstract class Recommendationhotelsremotesource {
  Future<List<HotelsModels>> fetchRecommendationHotels();
}

class RecommendationhotelsremotesourceImpl
    extends Recommendationhotelsremotesource {
  


  @override
  Future<List<HotelsModels>> fetchRecommendationHotels() async {
   
     var token = SharedPref.getData('token') ?? '';
    log("////respons before getting data");
    // var response = await DioProvider.get(MainEndpoint.home);
    var response = await DioProvider.get(
      MainEndpoint.hotelsRecommendations,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer $token',//21|FTOir1CRkQGr4ltvLoRuyodhqMdTSo8dgD0W1vs528d041cf', // لو موجود
      },
    );
    print(response.statusCode);
    print(response.data);
    log("////response after getting data");
    List<HotelsModels> recommendationHotels = [];
    for (var hotel in response.data!['data']) {
      recommendationHotels.add(HotelsModels.fromJson(hotel));
    }
    print(recommendationHotels);
    return recommendationHotels;
  }
}

import 'dart:developer';

import 'package:round_8_mobile_safarni_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/main_endpoint.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/data/data_source/flight_data_source.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/search_flight_param.dart';
import '../model/flight_seat_model.dart';
import '../model/search_flight_model.dart';

class FlightDataSourceImp extends FlightDataSource {
  @override
  Future<SearchFlightModel> searchAvailableFlights({
    required SearchFlightParam param,
  }) async {
    log(
      "Searching flights with params: origin=${param.origin}, destination=${param.destination}, date=${param.date}",
    );
    final response = await DioProvider.get(
      MainEndpoint.searchFlight,
      queryParameters: {
        'origin': param.origin,
        'destination': param.destination,
        'date': param.date,
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.data == null) {
      throw ServerFailure("Invalid response from server");
    }
    return SearchFlightModel.fromJson(response.data!);
  }

  @override
  Future<FlightSeatModel> getFlightSeats({required String flightId}) async {
    log("Fetching seats for flight ID: $flightId");

    try {
      final response = await DioProvider.get(
        "/flights/$flightId/seats",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );

      if (response.data == null) {
        throw ServerFailure("No seat data found for this flight");
      }

      return FlightSeatModel.fromJson(response.data!);
    } catch (e) {
      log("Error fetching seats: $e");
      throw ServerFailure(e.toString());
    }
  }
}

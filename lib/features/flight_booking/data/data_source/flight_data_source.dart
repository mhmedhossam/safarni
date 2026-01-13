import 'package:round_8_mobile_safarni_team3/features/flight_booking/data/model/flight_seat_model.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/data/model/search_flight_model.dart';

import '../../domain/entities/search_flight_param.dart';

abstract class FlightDataSource {
  Future<SearchFlightModel> searchAvailableFlights({required SearchFlightParam param });
  Future<FlightSeatModel> getFlightSeats({required String flightId });
}

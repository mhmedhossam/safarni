import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/data/model/search_flight_model.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/domain/entities/search_flight_param.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/flight_seat_model.dart';

abstract class FlightRepository {
  Future<Either<Failure, SearchFlightModel>> searchFlights({
    required SearchFlightParam param,
  });
  Future<Either<Failure, FlightSeatModel>> getFlightSeats({required String flightId });

}

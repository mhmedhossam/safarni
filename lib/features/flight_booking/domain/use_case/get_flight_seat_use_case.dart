import 'package:dartz/dartz.dart';
import 'package:safarni/features/flight_booking/data/model/flight_seat_model.dart';

import '../../../../core/error/failure.dart';
import '../repo/flight_repo.dart';

class GetFlightSeatUseCase {
  final FlightRepository repository;

  GetFlightSeatUseCase({required this.repository});

  Future<Either<Failure, FlightSeatModel>> call({
    required String flightId,
  }) async {
    return await repository.getFlightSeats(flightId: flightId);
  }
}

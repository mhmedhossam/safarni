import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/data/model/flight_seat_model.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/data/model/search_flight_model.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/domain/entities/search_flight_param.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/domain/repo/flight_repo.dart';

import '../../../../core/error/error_handler.dart';
import '../data_source/flight_data_source.dart';

class FlightRepoImp extends FlightRepository {
  final FlightDataSource remoteDataSource;

  FlightRepoImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, SearchFlightModel>> searchFlights({
    required SearchFlightParam param,
  }) async {
    try {
      final data = await remoteDataSource.searchAvailableFlights(param: param);

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, FlightSeatModel>> getFlightSeats({
    required String flightId,
  }) async {
    try {
      final data = await remoteDataSource.getFlightSeats(flightId: flightId);

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}

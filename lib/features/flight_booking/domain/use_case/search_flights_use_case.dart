import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/search_flight_model.dart';
import '../entities/search_flight_param.dart';
import '../repo/flight_repo.dart';

class SearchFlightsUseCase {
  final FlightRepository repository;
  SearchFlightsUseCase({required this.repository});

  Future<Either<Failure, SearchFlightModel>> call({
    required SearchFlightParam param,
  }) async {
    return await repository.searchFlights(param: param);
  }
}
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/flight_booking/domain/entities/search_flight_param.dart';
import 'package:safarni/features/flight_booking/domain/use_case/get_flight_seat_use_case.dart';
import 'package:safarni/features/flight_booking/domain/use_case/search_flights_use_case.dart';

import '../../data/model/flight_seat_model.dart';
import '../../data/model/search_flight_model.dart';

part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  final SearchFlightsUseCase searchFlightsUseCase;
  final GetFlightSeatUseCase flightSeatUseCase;

  FlightCubit({
    required this.searchFlightsUseCase,
    required this.flightSeatUseCase,
  }) : super(FlightInitial());

  Future<void> searchFlights({required SearchFlightParam param}) async {
    emit(SearchFlightLoading());
    final result = await searchFlightsUseCase.call(param: param);

    result.fold(
      (failure) => emit(SearchFlightFailure(errorMessage: failure.message)),
      (flightModel) =>
          emit(SearchFlightSuccess(searchFlightModel: flightModel)),
    );
  }

  Future<void> getFlightSeats({required String flightId}) async {
    emit(FlightSeatsLoading());
    final result = await flightSeatUseCase.call(flightId: flightId);
    result.fold(
      (failure) => emit(FlightSeatsFailure(errorMessage: failure.message)),
      (seatModel) => emit(FlightSeatsSuccess(flightSeatModel: seatModel)),
    );
  }
}

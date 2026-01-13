part of 'flight_cubit.dart';

@immutable
sealed class FlightState {}

final class FlightInitial extends FlightState {}
final class SearchFlightLoading extends FlightState {}
final class SearchFlightSuccess extends FlightState {
  final SearchFlightModel searchFlightModel;
  SearchFlightSuccess({required this.searchFlightModel});
}
final class SearchFlightFailure extends FlightState {
  final String errorMessage;
  SearchFlightFailure({required this.errorMessage});
}

final class FlightSeatsLoading extends FlightState {}
final class FlightSeatsSuccess extends FlightState {
  final FlightSeatModel flightSeatModel;
  FlightSeatsSuccess({required this.flightSeatModel});}
final class FlightSeatsFailure extends FlightState {
  final String errorMessage;
  FlightSeatsFailure({required this.errorMessage});
}



part of 'nearby_hotels_cubit.dart';

@immutable
sealed class NearbyHotelsState {}

final class NearbyHotelsInitial extends NearbyHotelsState {}

final class NearbyHotelsLoading extends NearbyHotelsState {}

final class NearbyHotelsSuccess extends NearbyHotelsState {
  final List<HotelsModels> hotels;
  NearbyHotelsSuccess(this.hotels);
}

final class NearbyHotelsFailure extends NearbyHotelsState {
  final String errorMessage;
  NearbyHotelsFailure(this.errorMessage);
}

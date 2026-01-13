part of 'hotels_rooms_cubit.dart';

@immutable
sealed class HotelsRoomsState {}

final class HotelsRoomsInitial extends HotelsRoomsState {}

final class HotelsRoomsLoading extends HotelsRoomsState {}

final class HotelsRoomsSuccess extends HotelsRoomsState {
  final List<RoomsModels> rooms;
  HotelsRoomsSuccess(this.rooms);
}

final class HotelsRoomsFailure extends HotelsRoomsState {
  final String errorMessage;
  HotelsRoomsFailure(this.errorMessage);
}

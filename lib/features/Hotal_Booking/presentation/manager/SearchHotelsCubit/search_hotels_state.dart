part of 'search_hotels_cubit.dart';

@immutable
sealed class SearchHotelsState {}

final class SearchHotelsInitial extends SearchHotelsState {}

final class SearchHotelsLoading extends SearchHotelsState {}

final class SearchHotelsLoaded extends SearchHotelsState {
  final List<HotelsModels> hotels;

  SearchHotelsLoaded({required this.hotels});
}

final class SearchHotelsFailure extends SearchHotelsState {
  final String message;

  SearchHotelsFailure({required this.message});
}

part of 'recommendation_hotels_cubit.dart';

@immutable
sealed class RecommendationHotelsState {}

final class RecommendationHotelsInitial extends RecommendationHotelsState {}

final class RecommendationHotelsLoading extends RecommendationHotelsState {}

final class RecommendationHotelsSuccess extends RecommendationHotelsState {
  final List<HotelsModels> hotels;
  RecommendationHotelsSuccess(this.hotels);
}

final class RecommendationHotelsFailure extends RecommendationHotelsState {
  final String errorMessage;
  RecommendationHotelsFailure(this.errorMessage);
}

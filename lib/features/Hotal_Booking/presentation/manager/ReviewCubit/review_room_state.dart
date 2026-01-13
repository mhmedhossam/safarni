part of 'review_room_cubit.dart';

@immutable
sealed class ReviewRoomState {}

final class ReviewRoomInitial extends ReviewRoomState {}
final class ReviewRoomLoading extends ReviewRoomState {}    
final class ReviewRoomSuccess extends ReviewRoomState {
  final List<ReviewModels> review;
  ReviewRoomSuccess(this.review);
} 
final class ReviewRoomFailure extends ReviewRoomState {
  final String errorMessage;
  ReviewRoomFailure(this.errorMessage);
}
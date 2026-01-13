part of 'gallery_room_cubit.dart';

@immutable
sealed class GalleryRoomState {}

final class GalleryRoomInitial extends GalleryRoomState {}

final class GalleryRoomLoading extends GalleryRoomState {}

final class GalleryRoomSuccess extends GalleryRoomState {
  final List<GalleryModels> galleryRooms;
  GalleryRoomSuccess(this.galleryRooms);
}

final class GalleryRoomFailure extends GalleryRoomState {
  final String errorMessage;
  GalleryRoomFailure(this.errorMessage);
}

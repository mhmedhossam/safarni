import 'package:round_8_mobile_safarni_team3/features/profile/domain/entity/user_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfileEntity profile;
  ProfileLoaded({required this.profile});
}

class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure({required this.message});
}

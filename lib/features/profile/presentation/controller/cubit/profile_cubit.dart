import 'package:bloc/bloc.dart';
import 'package:safarni/features/profile/domain/use_case/user_use_case.dart';
import 'package:safarni/features/profile/presentation/controller/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    final result = await getProfileUseCase();

    result.fold(
      (failure) => emit(ProfileFailure(message: failure.message)),
      (profile) => emit(ProfileLoaded(profile: profile)),
    );
  }
}

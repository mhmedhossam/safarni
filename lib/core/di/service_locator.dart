import 'package:get_it/get_it.dart';
import 'package:safarni/core/di/flight_service_locator.dart';
import 'package:safarni/core/services/local/shared_pref.dart';
import 'package:safarni/features/profile/domain/use_case/user_use_case.dart';
import 'package:safarni/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:safarni/core/services/api/network/dio_provider.dart';

// Home imports
import '../../features/Home/data/data_source/remote_data_source/remote_data_source.dart';
import '../../features/Home/data/data_source/remote_data_source/remote_data_source_impl.dart';
import '../../features/Home/data/home_repo/home_repo_impl.dart';
import '../../features/Home/domain/home_repo/home_repo.dart';
import '../../features/Home/domain/usecases/get_home_usecase.dart';

// Auth imports
import 'package:safarni/features/Hotal_Booking/data/remote/Gallery_RoomsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Hotels_RoomsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Hotels_Seach_RemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Nearby_HotelsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/RecommendationHotelsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/data/remote/Review_RoomsRemoteSource.dart';
import 'package:safarni/features/Hotal_Booking/data/repo_impl/Gallery_Rooms_Repo_Impl.dart';
import 'package:safarni/features/Hotal_Booking/data/repo_impl/Hotels_Rooms_Repo_Impl.dart';
import 'package:safarni/features/Hotal_Booking/data/repo_impl/Hotels_Search_Repo_Impl.dart';
import 'package:safarni/features/Hotal_Booking/data/repo_impl/Nearby_hotels_Repo_Impl.dart';
import 'package:safarni/features/Hotal_Booking/data/repo_impl/Recommendation_Hotels_Repo_Impl.dart';
import 'package:safarni/features/Hotal_Booking/data/repo_impl/Review_Rooms_Repo_Impl.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Gallery_Use_Case.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Hotels_Room_UseCase.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Hotels_Search_UseCase.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Nearby_Hotels_Use_Case.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Recommendation_Hotels_UseCase.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Review_Use_Case.dart';
import 'package:safarni/features/auth/data/remote/remote_data_source_impl.dart';
import 'package:safarni/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';
import 'package:safarni/features/auth/domain/usecases/use_cases.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';

import '../../features/auth/data/remote/remote_data_source.dart';

// Profile imports
import '../../features/profile/data/remote/remote_data_source.dart';
import '../../features/profile/data/repo_impl/repo_impl.dart';
import '../../features/profile/domain/repo/repo.dart';

class ServiceLocator {
  static final gi = GetIt.instance;

  static Future<void> setupServiceLocator() async {
    DioProvider.init();
    await SharedPref.init();

    await flightServiceLocator();

    // Home
    gi.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    );
    gi.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeRemoteDataSource: gi<HomeRemoteDataSource>()),
    );
    gi.registerLazySingleton<GetHomeUseCase>(
      () => GetHomeUseCase(homeRepo: gi<HomeRepo>()),
    );

    // Auth
    final sharedPreferences = await SharedPreferences.getInstance();
    gi.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    gi.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(remote: gi()));
    gi.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
    gi.registerLazySingleton(() => RegisterUseCase(repo: gi()));
    gi.registerLazySingleton(() => VerifyUseCase(repo: gi()));
    gi.registerLazySingleton(() => LoginUseCase(repository: gi()));
    gi.registerLazySingleton(() => LogoutUseCase(repo: gi()));
    gi.registerLazySingleton(() => ForgotPasswordUseCase(gi()));
    gi.registerFactory(
      () => AuthCubit(
        registerUseCase: gi(),
        verifyUseCase: gi(),
        loginUseCase: gi(),
        logoutUseCase: gi(),
        forgotPasswordUseCase: gi(),
      ),
    );

    // Profile
    gi.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(
        dio: DioProvider.dio,
        prefs: gi<SharedPreferences>(),
      ),
    );
    gi.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImpl(remote: gi<ProfileRemoteDataSource>()),
    );
    gi.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(repo: gi<ProfileRepo>()),
    );
    gi.registerLazySingleton(
      () => ProfileCubit(getProfileUseCase: gi<GetProfileUseCase>()),
    );

    tantawy();
  }

  static void tantawy() {
    // Recommendation Hotels
    gi.registerLazySingleton<RecommendationHotelsUsecase>(
      () => RecommendationHotelsUsecase(gi<RecommendationHotelsRepoImpl>()),
    );
    gi.registerLazySingleton<RecommendationHotelsRepoImpl>(
      () =>
          RecommendationHotelsRepoImpl(RecommendationhotelsremotesourceImpl()),
    );
    // naerby Hotels
    gi.registerLazySingleton<NearbyHotelsUseCase>(
      () => NearbyHotelsUseCase(gi<NearbyHotelsRepoImpl>()),
    );
    gi.registerLazySingleton<NearbyHotelsRepoImpl>(
      () => NearbyHotelsRepoImpl(NearbyHotelsRemoteSourceImpl()),
    );
    //Hotels Rooms
    gi.registerLazySingleton<HotelsRoomUsecase>(
      () => HotelsRoomUsecase(gi<HotelsRoomsRepoImpl>()),
    );
    gi.registerLazySingleton<HotelsRoomsRepoImpl>(
      () => HotelsRoomsRepoImpl(HotelsRoomsRemoteSourceImpl()),
    );
    // search Hotels
    gi.registerLazySingleton<HotelsSearchUsecase>(
      () => HotelsSearchUsecase(gi<HotelsSearchRepoImpl>()),
    );
    gi.registerLazySingleton<HotelsSearchRepoImpl>(
      () => HotelsSearchRepoImpl(HotelsSearchRemoteSourceImpl()),
    );
    // Gallery Hotels
    gi.registerLazySingleton<GalleryUseCase>(
      () => GalleryUseCase(gi<GalleryRoomsRepoImpl>()),
    );
    gi.registerLazySingleton<GalleryRoomsRepoImpl>(
      () => GalleryRoomsRepoImpl(GalleryRoomsRemoteSourceImpl()),
    );
    // Review Hotels
    gi.registerLazySingleton<ReviewUseCase>(
      () => ReviewUseCase(gi<ReviewRoomsRepoImpl>()),
    );
    gi.registerLazySingleton<ReviewRoomsRepoImpl>(
      () => ReviewRoomsRepoImpl(ReviewRoomsRemoteSourceImpl()),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safarni/core/checkout_page/check_out_success.dart';
import 'package:safarni/core/checkout_page/checkout_page.dart';
import 'package:safarni/core/di/service_locator.dart';
import 'package:safarni/features/Home/domain/entities/recommendation_entity.dart';
import 'package:safarni/features/Home/domain/usecases/get_home_usecase.dart';
import 'package:safarni/features/Home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:safarni/features/Home/presentation/views/destination_page.dart';
import 'package:safarni/features/Home/presentation/views/internal_page.dart';
import 'package:safarni/features/Home/presentation/views/main_screen.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsAndRoomModels.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/Hotel_Rooms_View.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/Review_View.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/Rooms_Details_View.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/widget/custom_search_hotals.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/car_booking/presentation/screens/car_booking_screen.dart';
import 'package:safarni/features/favourite/presentation/screens/favorite_screen.dart';
import 'package:safarni/features/flight_booking/data/model/search_flight_model.dart';
import 'package:safarni/features/flight_booking/presentation/screens/boarding_pass_screen.dart';
import 'package:safarni/features/flight_booking/presentation/screens/choose_seat_screen.dart';
import 'package:safarni/features/flight_booking/presentation/screens/search_flight_screen.dart';
import 'package:safarni/features/flight_booking/presentation/screens/select_flight_screen.dart';
import 'package:safarni/features/auth/presentation/ui_screens/forget_password.dart';
import 'package:safarni/features/auth/presentation/ui_screens/login_screen.dart';
import 'package:safarni/features/auth/presentation/ui_screens/sigin_up.dart';
import 'package:safarni/features/auth/presentation/ui_screens/verfiy_email.dart';
import 'package:safarni/features/intro/presentation/ui_screens/intro.dart';
import 'package:safarni/features/page_view.dart/presentation/ui_screens/on_boarding.dart';
import 'package:safarni/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:safarni/features/profile/presentation/ui_screen.dart/my_booking.dart';
import 'package:safarni/features/profile/presentation/ui_screen.dart/personal_info.dart';
import 'package:safarni/features/profile/presentation/ui_screen.dart/profile.dart';
import 'package:safarni/features/profile/presentation/ui_screen.dart/security_account.dart';

import '../../features/auth/presentation/ui_screens/password_reseted.dart';
import '../../features/auth/presentation/ui_screens/reset_password.dart';
import '../../features/car_booking/presentation/screens/car_detail_screen.dart';
import '../../features/car_booking/presentation/screens/car_map_screen.dart';
import '../../features/flight_booking/presentation/cubit/flight_cubit.dart';
import '../../features/page_view.dart/presentation/ui_screens/welcom_screen.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/hotels_booking_view.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/checkin_andout_view.dart';
import '../../main.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Routes {
  static String favouriteScreen = "/favourite_screen";
  static String flightBookingScreen = "/flight_booking_screen";
  static String selectFlightScreen = "/select_flight_screen";
  static String splashScreen = "/splash_screen";
  static String checkOutSuccess = "/checkOutSuccess_screen";
  static String onboarding = "/onboarding_screen";
  static String welcom = "/welcome_screen";
  static String login = "/login_screen";
  static String siginUp = "/sigin_up_screen";
  static String forgetPassword = "/forget_password_screen";
  static String resetPassword = "/reset_password_screen";
  static String passwordReseted = "/password_reseted_screen";
  static String verify = "/verfiy_screen";
  static String profile = "/profile_screen";
  static String persoalInfo = "/personal_info_screen";
  static String security = "/security&account_screen";
  static String hotelsBookingScreen = "/hotels_booking_screen";
  static String reviewScreen = "/review_screen";
  static String checkoutandinScreen = "/checkout_and_in_screen";
  static String mybookingScreen = "/mybooking_screen";
  static String destinationScreen = "/destination_screen";
  static String checkOut = "/checkOut_screen";
  static String internalScreen = "/internal_screen";
  static String carBooking = "/car_booking_screen";
  static String carDetailScreen = "/car_detail_screen";
  static String carMapScreen = "/car_map_screen";
  static String mainNavigationScreen = "/main_navigation_screen";
  static String favoriteScreen = "/favorite_screen";
  static String seatSelection = "/seat_selection_screen";
  static String boardingPassScreen = "/boarding_pass_screen";
  static String hotelsRooomsScreen = "/hotels_rooms_screen";
  static String rooomsDetailsScreen = "/rooms_Details_screen";
  static String hotelslistScreen = "/hotels_list_screen";

  //HotelListScreen
  static var routes = GoRouter(
    initialLocation: splashScreen, // splashScreen,
    navigatorKey: navigatorKey,
    routes: [
      ///Flight Screen
      GoRoute(
        path: flightBookingScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ServiceLocator.gi.get<FlightCubit>(),
          child: SearchFlightScreen(),
        ),
      ),
      GoRoute(
        path: selectFlightScreen,

        builder: (context, state) {
          final flights = state.extra as List<SearchFlightModelData>;

          return SelectFlightScreen(flights: flights);
        },
      ),
      GoRoute(
        path: seatSelection,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) =>
                ServiceLocator.gi.get<FlightCubit>()
                  ..getFlightSeats(flightId: data['flightId'] as String),
            child: SeatSelectionScreen(
              flight: data['flight'] as SearchFlightModelData,
            ),
          );
        },
      ),
      GoRoute(
        path: boardingPassScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return BoardingPassScreen(
            flight: data['flight'] as SearchFlightModelData,
            selectedSeats: data['selectedSeats'] as List<dynamic>,
            totalPrice: data['totalPrice'] as double,
          );
        },
      ),
      GoRoute(
        path: hotelslistScreen,
        builder: (context, state) => HotelListScreen(),
      ),

      ///car booking routes
      GoRoute(
        path: carBooking,
        builder: (context, state) => CarBookingScreen(),
      ),
      GoRoute(
        path: carDetailScreen,
        builder: (context, state) => CarDetailScreen(),
      ),
      GoRoute(path: carMapScreen, builder: (context, state) => CarMapScreen()),
      GoRoute(
        path: favoriteScreen,
        builder: (context, state) => FavoriteScreen(),
      ),
      GoRoute(
        path: hotelsRooomsScreen,
        builder: (context, state) {
          var hotelsmodels = state.extra as HotelsModels;
          return HotelRoomsView(hotelsmodels: hotelsmodels);
        },
      ),
      GoRoute(
        path: rooomsDetailsScreen,
        builder: (context, state) {
          var hotelsmodels = state.extra as HotelsandroomModels;
          return RoomsDetailsView(rooms: hotelsmodels);
        },
      ),
      //Auth Screens
      GoRoute(path: splashScreen, builder: (context, state) => const Intro()),
      GoRoute(
        path: checkOutSuccess,
        builder: (context, state) => const CheckOutSuccess(),
      ),
      GoRoute(
        path: checkOut,
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: destinationScreen,
        builder: (context, state) => DestinationPage(
          recommendationEntity: state.extra as RecommendationEntity,
        ),
      ),
      GoRoute(
        path: internalScreen,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              HomeCubit(getHomeUseCase: ServiceLocator.gi<GetHomeUseCase>()),
          child: const InternalPage(),
        ),
      ),
      GoRoute(path: welcom, builder: (context, state) => const Welcome()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => ServiceLocator.gi<AuthCubit>(),
          child: const Login(),
        ),
      ),
      GoRoute(
        path: siginUp,
        builder: (context, state) => BlocProvider(
          create: (context) => ServiceLocator.gi<AuthCubit>(),
          child: const SignUp(),
        ),
      ),
      GoRoute(
        path: mybookingScreen,
        builder: (context, state) => const MyBookingView(),
      ),

      GoRoute(
        path: verify,
        builder: (context, state) {
          final email = state.extra as String;
          return VerifyEmail(email: email);
        },
      ),
      GoRoute(path: profile, builder: (context, state) => const Profile()),
      GoRoute(
        path: security,
        builder: (context, state) => const SecurityAccount(),
      ),
      GoRoute(
        path: persoalInfo,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ServiceLocator.gi<ProfileCubit>()..fetchProfile(),
          child: const PersonalInfo(),
        ),
      ),
      GoRoute(
        path: passwordReseted,
        builder: (context, state) => const PasswordReseted(),
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => const ResetPassword(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: hotelsBookingScreen,
        builder: (context, state) => const HotelsBookingView(),
      ),
      GoRoute(
        path: checkoutandinScreen,
        builder: (context, state) => const CheckinandoutView(),
      ),
      GoRoute(
        path: reviewScreen,
        builder: (context, state) => const ReviewView(),
      ),

      GoRoute(
        path: mainNavigationScreen,
        builder: (context, state) => const MainNavigationScreen(),
      ),
    ],
  );
}

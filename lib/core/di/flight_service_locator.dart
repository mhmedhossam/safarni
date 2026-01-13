import 'package:safarni/core/di/service_locator.dart';
import 'package:safarni/features/flight_booking/data/data_source/flight_data_source.dart';
import 'package:safarni/features/flight_booking/data/repo_imp/flight_repo_imp.dart';
import 'package:safarni/features/flight_booking/domain/repo/flight_repo.dart';
import 'package:safarni/features/flight_booking/domain/use_case/get_flight_seat_use_case.dart';
import 'package:safarni/features/flight_booking/domain/use_case/search_flights_use_case.dart';
import 'package:safarni/features/flight_booking/presentation/cubit/flight_cubit.dart';

import '../../features/flight_booking/data/data_source/flight_data_source_imp.dart';

Future<void> flightServiceLocator() async {
  ServiceLocator.gi.registerLazySingleton<FlightDataSource>(
    () => FlightDataSourceImp(),
  );
  ServiceLocator.gi.registerLazySingleton<FlightRepository>(
    () =>
        FlightRepoImp(remoteDataSource: ServiceLocator.gi<FlightDataSource>()),
  );
  ServiceLocator.gi.registerLazySingleton<SearchFlightsUseCase>(
    () =>
        SearchFlightsUseCase(repository: ServiceLocator.gi<FlightRepository>()),
  );
  ServiceLocator.gi.registerLazySingleton<GetFlightSeatUseCase>(
    () =>
        GetFlightSeatUseCase(repository: ServiceLocator.gi<FlightRepository>()),
  );
  ServiceLocator.gi.registerFactory<FlightCubit>(
    () => FlightCubit(
      searchFlightsUseCase: ServiceLocator.gi<SearchFlightsUseCase>(),
      flightSeatUseCase: ServiceLocator.gi<GetFlightSeatUseCase>(),
    ),
  );
}

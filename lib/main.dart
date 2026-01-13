import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_safarni_team3/core/bloc/app_bloc_observer.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_safarni_team3/core/di/service_locator.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_theme.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/remote/RecommendationHotelsRemoteSource.dart';
import 'package:round_8_mobile_safarni_team3/features/auth/presentation/controller/cubit/auth_cubit.dart';

import 'core/services/local/shared_pref.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();

  await ServiceLocator.setupServiceLocator();
  await SharedPref.init();
  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(enabled: false, builder: (context) => const Safarni()));
}

class Safarni extends StatelessWidget {
  const Safarni({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.gi<AuthCubit>(),
      child: MaterialApp.router(
        theme: AppTheme.themeDate,
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.routes,
      ),
    );
  }
}

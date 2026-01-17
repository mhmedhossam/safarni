import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/di/service_locator.dart';
import 'package:safarni/features/Home/domain/usecases/get_home_usecase.dart';
import 'package:safarni/features/Home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:safarni/features/Home/presentation/views/home_screen.dart';
import 'package:safarni/features/Home/presentation/views/internal_page.dart';
import 'package:safarni/features/auth/domain/usecases/use_cases.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/favourite/presentation/screens/favorite_screen.dart';
import 'package:safarni/features/map/presentation/map_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  late CircularBottomNavigationController _navigationController;

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeCubit(getHomeUseCase: ServiceLocator.gi<GetHomeUseCase>())
                  ..getHome(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(
              registerUseCase: ServiceLocator.gi<RegisterUseCase>(),
              verifyUseCase: ServiceLocator.gi<VerifyUseCase>(),
              loginUseCase: ServiceLocator.gi<LoginUseCase>(),
              logoutUseCase: ServiceLocator.gi<LogoutUseCase>(),
              forgotPasswordUseCase: ServiceLocator.gi<ForgotPasswordUseCase>(),
            ),
          ),
        ],
        child: HomeScreen(),
      ),
      const FavoriteScreen(),
      BlocProvider(
        create: (context) =>
            HomeCubit(getHomeUseCase: ServiceLocator.gi<GetHomeUseCase>()),
        child: const InternalPage(),
      ),
      const MapScreen(),
    ];
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = List.of([
      TabItem(
        Icons.home,
        "Home",
        Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TabItem(
        Icons.favorite,
        "Favorite",
        Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TabItem(
        Icons.compare_arrows,
        "Compare",
        Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TabItem(
        Icons.map,
        "Maps",
        Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ]);

    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            pages[selectedPos],

            Align(
              alignment: Alignment.bottomCenter,
              child: CircularBottomNavigation(
                tabItems,
                controller: _navigationController,
                selectedPos: selectedPos,
                barHeight: bottomNavBarHeight,
                barBackgroundColor: Colors.white,
                backgroundBoxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10.0),
                ],
                animationDuration: const Duration(milliseconds: 300),
                selectedCallback: (int? pos) {
                  if (pos != null) {
                    setState(() {
                      selectedPos = pos;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

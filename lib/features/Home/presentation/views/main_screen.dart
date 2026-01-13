import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_safarni_team3/core/di/service_locator.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/domain/usecases/get_home_usecase.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/presentation/views/home_screen.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/presentation/views/internal_page.dart';
import 'package:round_8_mobile_safarni_team3/features/favourite/presentation/screens/favorite_screen.dart';
import 'package:round_8_mobile_safarni_team3/features/map/presentation/map_screen.dart';

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
      BlocProvider<HomeCubit>(
        create: (context) =>
            HomeCubit(getHomeUseCase: ServiceLocator.gi<GetHomeUseCase>())
              ..getHome(),
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

    return Scaffold(
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
    );
  }
}

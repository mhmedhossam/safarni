import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/di/service_locator.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Nearby_Hotels_Use_Case.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Recommendation_Hotels_UseCase.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/widget/nearby_hotel_card.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/widget/recommended_hotal_card.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/Hotal_Booking/presentation/manager/nearbyHotelCubit/nearby_hotels_cubit.dart';
import 'package:safarni/features/Hotal_Booking/presentation/manager/recommendation_hotelsCubit/recommendation_hotels_cubit.dart';

class HotelsBookingView extends StatelessWidget {
  const HotelsBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecommendationHotelsCubit(
            ServiceLocator.gi<RecommendationHotelsUsecase>(),
          )..fetchRecommendationHotels(),
        ),
        BlocProvider(
          create: (context) =>
              NearbyHotelsCubit(ServiceLocator.gi<NearbyHotelsUseCase>())
                ..fetchNearbyHotels(),
        ),
      ],

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8.0),
            child: CustomScrollView(
              slivers: [
                // Search Bar
                SliverToBoxAdapter(
                  child: TextField(
                    onTap: () =>
                        GoRouter.of(context).push(Routes.hotelslistScreen),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      hintText: "Search for hotels...",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: Gap(24)),

                // Recommended Section Title
                SliverToBoxAdapter(
                  child: Text(
                    'Recommended',
                    style: TextStyles.details.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111928),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: Gap(16)),

                // Horizontal Scrollable Recommended Hotels
                SliverToBoxAdapter(
                  child:
                      BlocBuilder<
                        RecommendationHotelsCubit,
                        RecommendationHotelsState
                      >(
                        builder: (context, state) {
                          if (state is RecommendationHotelsFailure) {
                            return Center(
                              child: Text('Error: ${state.errorMessage}'),
                            );
                          } else if (state is RecommendationHotelsSuccess) {
                            final hotels = state.hotels;
                            return SizedBox(
                              height: 280,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: hotels.length,
                                itemBuilder: (context, index) {
                                  final hotel = hotels[index];
                                  return RecommendedHotelCard(
                                    hotel: hotel,
                                    onTap: () {
                                      GoRouter.of(context).push(
                                        Routes.hotelsRooomsScreen,
                                        extra: hotel,
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                ),

                SliverToBoxAdapter(child: Gap(20)),

                // Nearby Hotels Section Title
                SliverToBoxAdapter(
                  child: Text(
                    'Nearby Hotels',
                    style: TextStyles.details.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111928),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: Gap(12)),

                // Vertical List of Nearby Hotels
                SliverToBoxAdapter(
                  child: BlocBuilder<NearbyHotelsCubit, NearbyHotelsState>(
                    builder: (context, state) {
                      if (state is NearbyHotelsFailure) {
                        return Center(
                          child: Text('Error: ${state.errorMessage}'),
                        );
                      } else if (state is NearbyHotelsSuccess) {
                        final hotels = state.hotels;

                        return Column(
                          children: List.generate(
                            hotels.length,
                            (index) => NearbyHotelCard(
                              hotel: hotels[index],
                              onTap: () {
                                GoRouter.of(context).push(
                                  Routes.hotelsRooomsScreen,
                                  extra: hotels[index],
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

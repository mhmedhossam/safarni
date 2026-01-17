import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/di/service_locator.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsAndRoomModels.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/usecases/Hotels_Room_UseCase.dart';
import 'package:safarni/features/Hotal_Booking/presentation/View/widget/room_card.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/Hotal_Booking/presentation/manager/hotelsRoomsCubit/hotels_rooms_cubit.dart';

class HotelRoomsView extends StatelessWidget {
  final HotelsModels hotelsmodels;
  const HotelRoomsView({super.key, required this.hotelsmodels});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HotelsRoomsCubit(ServiceLocator.gi<HotelsRoomUsecase>())
            ..fetchRoomsHotels(hotelId: hotelsmodels.id!),
      child: SafeArea(
        top: false,
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
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  CustomSearchHotals(),
                //    Gap(  18),
                Text(
                  'Available Rooms ',
                  style: TextStyles.details.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111928),
                  ),
                ),
                Gap(8),
                BlocBuilder<HotelsRoomsCubit, HotelsRoomsState>(
                  builder: (context, state) {
                    if (state is HotelsRoomsSuccess) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 2,
                                childAspectRatio: 0.82,
                              ),
                          itemCount: state.rooms.length,
                          itemBuilder: (context, index) {
                            HotelsandroomModels hotelandRooms =
                                HotelsandroomModels(
                                  hotelsModels: hotelsmodels,
                                  roomsModels: state.rooms[index],
                                );
                            return RoomCard(
                              room: state.rooms[index],
                              onTap: () {
                                GoRouter.of(context).push(
                                  Routes.rooomsDetailsScreen,
                                  extra: hotelandRooms,
                                );
                              },
                            );
                          },
                        ),
                      );
                    } else if (state is HotelsRoomsFailure) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: TextStyles.details,
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

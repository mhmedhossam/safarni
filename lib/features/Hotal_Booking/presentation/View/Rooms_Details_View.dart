import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_safarni_team3/core/di/service_locator.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsAndRoomModels.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/Roos/rooms_models.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Gallery_Use_Case.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Review_Use_Case.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/View/widget/GalleryContent.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/View/widget/ReviewContent.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/manager/GalleryRoomCubit/gallery_room_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/manager/ReviewCubit/review_room_cubit.dart';

class RoomsDetailsView extends StatefulWidget {
  const RoomsDetailsView({super.key, required this.rooms});
  final HotelsandroomModels rooms;
  @override
  State<RoomsDetailsView> createState() => _RoomsDetailsViewState();
}

class _RoomsDetailsViewState extends State<RoomsDetailsView> {
  int selectedTab = 0;
  // 0: About, 1: Gallery, 2: Review
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) =>
              GalleryRoomCubit(ServiceLocator.gi<GalleryUseCase>())
                ..fetchGalleryRooms(hotelId: widget.rooms.roomsModels.hotelId!),
    
    
        ),
            BlocProvider(
                create: (context) => ReviewRoomCubit(ServiceLocator.gi<ReviewUseCase>())
                  ..fetchReviewRoom(hotelId: widget.rooms.roomsModels.hotelId!),
            ),
        ],
              child: Scaffold(
            body: CustomScrollView(
              slivers: [
                // صورة الفندق العلوية
                CustomSliverAppBar(heigthmodels: false),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
    
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFEBF5FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.rooms.hotelsModels.discount}% off",
                                    style: TextStyles.details.copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF3A86FF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            const Icon(Icons.star, size: 14, color: Colors.amber),
    
                            const SizedBox(width: 4),
                            Text(
                              widget.rooms.hotelsModels.rating.toString(),
                              style: TextStyles.details.copyWith(fontSize: 13),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '(356 reviews)',
                              style: TextStyles.details.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.rooms.hotelsModels.name.toString(),
                          style: TextStyles.details.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111928),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.rooms.hotelsModels.address.toString(),
                          style: TextStyles.details.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
    
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    
                SliverList(
                  delegate: SliverChildListDelegate([
                    // Three Tabs Bar
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTab("About", 0),
                          Spacer(),
                          _buildTab("Gallery", 1),
                          Spacer(),
    
                          _buildTab("Review", 2),
                        ],
                      ),
                    ),
    
                    // Content based on selected tab
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: selectedTab == 0
                          ? _buildAboutContent(room: widget.rooms.roomsModels)
                          : selectedTab == 1
                          ? Gallerycontent()
                          : Reviewcontent(),
                    ),
    
                    const SizedBox(height: 100),
                  ]),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 125,
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        'Total price',
                        style: TextStyles.details.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF111928),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${widget.rooms.roomsModels.pricePerNight}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E5CFF),
                            ),
                          ),
                          Text(
                            '/Night',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(Routes.checkoutandinScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E429F),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyles.details.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  // About Content
  Widget _buildAboutContent({required RoomsModels room}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset("assets/icons/bed_icon.svg"),
            const SizedBox(width: 8),
            Text(
              '${room.bedType} Beds',
              style: TextStyles.details.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF111928),
              ),
            ),
            Spacer(),
            SvgPicture.asset("assets/icons/bath_icon.svg"),
            const SizedBox(width: 8),
            Text(
              '${room.bathrooms} Bath',
              style: TextStyles.details.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF111928),
              ),
            ),
            Spacer(),

            SvgPicture.asset("assets/icons/Frame.svg"),
            const SizedBox(width: 8),
            Text(
              '${room.area ?? "N/A"} Sqrt',
              style: TextStyles.details.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF111928),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        Text(
          'Description',
          style: TextStyles.details.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111928),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.rooms.hotelsModels.description.toString(),
          style: TextStyles.details.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6B7280),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index), // Update selected tab
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            //  border: Border.all(color: Colors.white),
          ),
          child: Column(
            children: [
              // Display the tab text
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.details.copyWith(
                  color: selectedTab == index
                      ? Color(0xFF1E429F)
                      : Colors.black, // Change text color
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              // Add an underline only if this tab is selected
              selectedTab == index
                  ? Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ), // Space between text and underline
                      height: 2,
                      width: 50, // Width of the underline
                      color: Color(0xFF1E429F), // Color of the underline
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ), // Space between text and underline
                      height: 2,
                      width: 50, // Width of the underline
                      color: Colors.white, // Color of the underline
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.heigthmodels});
  final bool? heigthmodels;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: heigthmodels == true ? 180 : 290,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.grey[300],
              //    child: SvgPicture.asset("assets/images/Room.svg"),
              child: Image.asset("assets/images/Rooms.png", fit: BoxFit.cover),
            ),
            heigthmodels == true
                ? SizedBox()
                : Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deluxe Room',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Hotel Merdeka',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
            Positioned(
              top: 50,
              left: 16,

              child: Container(
                width: 50, // Set the width
                height: 50, // Set the height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Change as needed
                ),
                child: IconButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Go back when pressed
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

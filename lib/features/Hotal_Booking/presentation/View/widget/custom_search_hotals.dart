import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/di/service_locator.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/domain/usecases/Hotels_Search_UseCase.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/View/widget/nearby_hotel_card.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/manager/SearchHotelsCubit/search_hotels_cubit.dart';

class CustomSearchHotels extends StatefulWidget {
  final String? hintText;

  const CustomSearchHotels({super.key, this.hintText = 'Search hotels...'});

  @override
  State<CustomSearchHotels> createState() => _CustomSearchHotelsState();
}

class _CustomSearchHotelsState extends State<CustomSearchHotels> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {}); // Update UI to show/hide clear button

        // Trigger search when user types
        if (value.isNotEmpty) {
          context.read<SearchHotelsCubit>().fetchSearchHotels(city: value);
        }
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  _searchController.clear();
                  setState(() {}); // Update UI to hide clear button
                },
              )
            : null,
      ),
    );
  }
}

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchHotelsCubit(ServiceLocator.gi<HotelsSearchUsecase>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Hotels')),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomSearchHotels(),
            ),
            Expanded(
              child: BlocBuilder<SearchHotelsCubit, SearchHotelsState>(
                builder: (context, state) {
                  if (state is SearchHotelsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchHotelsLoaded) {
                    // Check if hotels list is empty
                    if (state.hotels.isEmpty) {
                      return const Center(
                        child: Text('No hotels found for this search.'),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.hotels.length,
                      itemBuilder: (context, index) {
                        final hotel = state.hotels[index];
                        return NearbyHotelCard(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push(Routes.hotelsRooomsScreen, extra: hotel);
                          },
                          hotel: hotel,
                        );
                      },
                    );
                  } else if (state is SearchHotelsFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 60,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Please enter a city to search hotels.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
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

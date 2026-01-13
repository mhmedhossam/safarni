import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_date_picker.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/presentation/cubit/flight_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/presentation/cubit/flight_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/flight_booking/presentation/widgets/flight_booking_widgets/flight_type_chips.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_drop_down_field.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';
import '../../domain/entities/search_flight_param.dart';

class SearchFlightScreen extends StatefulWidget {
  const SearchFlightScreen({super.key});

  @override
  State<SearchFlightScreen> createState() => _SearchFlightScreenState();
}

class _SearchFlightScreenState extends State<SearchFlightScreen> {
  final TextEditingController locationController = TextEditingController();

  final TextEditingController destinationController = TextEditingController();

  final TextEditingController departureController = TextEditingController();

  final TextEditingController returnController = TextEditingController();

  final TextEditingController passengerController = TextEditingController(
    text: "1 Passenger",
  );
  String? _selectedPassenger = "1 Passenger";
  final List<String> _passengerOptions = [
    "1 Passenger",
    "2 Passengers",
    "3 Passengers",
    "4 Passengers",
  ];
  final ScrollController _scrollController = ScrollController();
  final FocusNode _locationFocus = FocusNode();
  final FocusNode _destinationFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _locationFocus.addListener(_onFocusChange);
    _destinationFocus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_locationFocus.hasFocus || _destinationFocus.hasFocus) {
      _scrollController.animateTo(
        MediaQuery.of(context).size.height * 0.3,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _locationFocus.dispose();
    _destinationFocus.dispose();
    locationController.dispose();
    destinationController.dispose();
    departureController.dispose();
    returnController.dispose();
    passengerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<FlightCubit, FlightState>(
        listener: (context, state) {
          if (state is SearchFlightSuccess) {
            Navigation.push(
              context,
              Routes.selectFlightScreen,
              state.searchFlightModel.data,
            );
          }
          if (state is SearchFlightFailure) {
            CustomSnackBar.showError(context, state.errorMessage);
            log(state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SearchFlightLoading,
            progressIndicator: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: AppColors.primaryColor),
                  const SizedBox(height: 15),
                  Text(
                    "Searching Flights...",
                    style: TextStyles.title.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                    ),
                  ),
                ],
              ),
            ),
            opacity: 0.5,
            color: AppColors.secondaryColor,
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height * 0.3,
                      pinned: true,
                      floating: true,
                      snap: true,
                      backgroundColor: AppColors.primaryColor,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigation.pop(context);
                        },
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          "Book Your Flight",
                          style: TextStyles.title.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                        background: Image.asset(
                          Assets.imagesFlight,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.3,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlightTypeChips(),
                              const SizedBox(height: 25),
                              _buildLabel("Location"),
                              CustomTextForm(
                                focusNode: _locationFocus,
                                controller: locationController,
                                hint: "Enter origin Airport code",
                                prefix: const Icon(Icons.location_on_outlined),
                                maxLength: 3,
                              ),

                              const SizedBox(height: 15),
                              _buildLabel("Destination"),
                              CustomTextForm(
                                focusNode: _destinationFocus,
                                controller: destinationController,
                                hint: "Enter destination Airport code",
                                prefix: const Icon(Icons.flight_land),
                                maxLength: 3,
                              ),

                              const SizedBox(height: 15),

                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildLabel("Departure"),
                                        CustomTextForm(
                                          controller: departureController,
                                          hint: "Select date",
                                          readonly: true,
                                          onTap: () =>
                                              CustomDatePicker.selectDate(
                                                context: context,
                                                controller: departureController,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildLabel("Return"),
                                        CustomTextForm(
                                          controller: returnController,
                                          hint: "Select date",
                                          readonly: true,
                                          onTap: () =>
                                              CustomDatePicker.selectDate(
                                                context: context,
                                                controller: returnController,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                              _buildLabel("Passenger"),
                              CustomDropdownField(
                                hint: "Select Passengers",
                                value: _selectedPassenger,
                                items: _passengerOptions,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPassenger = newValue;
                                    passengerController.text = newValue ?? "";
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  left: 20,
                  right: 20,
                  child: CustomButton(
                    title: "Search Flights",
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () async {
                      await context.read<FlightCubit>().searchFlights(
                        param: SearchFlightParam(
                          origin: locationController.text,
                          destination: destinationController.text,
                          date: departureController.text,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

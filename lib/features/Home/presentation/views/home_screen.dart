import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/navigation.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/core/widgets/custom_text_form_field.dart';
import 'package:safarni/features/Home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:safarni/features/Home/presentation/cubit/home_cubit/home_states.dart';
import 'package:safarni/features/Home/domain/entities/recommendation_entity.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  16,
                  16,
                  100,
                ), // padding bottom للـ NavBar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Explore The Best Places In World!'),
                      trailing: GestureDetector(
                        onTap: () {
                          Navigation.push(context, Routes.profile);
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(Assets.man1),
                        ),
                      ),
                    ),
                    const Gap(20),

                    // Search Bar
                    CustomTextForm(
                      readonly: true,
                      onTap: () {
                        Navigation.push(context, Routes.internalScreen);
                      },
                      hint: 'Search destinations...',

                      prefix: const Icon(Icons.search),

                      fillColor: Colors.grey[100],
                    ),
                    const Gap(25),

                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),

                    // Categories Row
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return _CategoryItem(
                            icon: Icons.flight,
                            label: cubit.homeEntity.categories[i].name,
                            onTap: () => Navigation.push(
                              context,
                              i == 0
                                  ? Routes.internalScreen
                                  : i == 1
                                  ? Routes.flightBookingScreen
                                  : i == 2
                                  ? Routes.hotelsBookingScreen
                                  : Routes.carBooking,
                            ),
                          );
                        },
                        itemCount: cubit.homeEntity.categories.length,
                      ),
                    ),

                    _buildSectionHeader("Recommendations"),
                    Gap(10),

                    // Horizontal List
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.homeEntity.recommendations.length > 3
                            ? 3
                            : cubit.homeEntity.recommendations.length,
                        itemBuilder: (context, index) => _HorizontalCard(
                          recommendationEntity:
                              cubit.homeEntity.recommendations[index],
                        ),
                      ),
                    ),
                    const Gap(30),

                    _buildSectionHeader("Available Tours"),
                    const Gap(15),

                    // Vertical List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.homeEntity.recommendations.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => _VerticalTourCard(
                        recommendationEntity:
                            cubit.homeEntity.recommendations[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is HomeLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeFailureState) {
          return Center(child: Text(state.message));
        } else {
          return Text("error please try again");
        }
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text('View all', style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback onTap;
  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(Assets.des4),
              backgroundColor: Colors.blue[50],
            ),
          ),
          Gap(8),
          Text(
            label ?? "",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  final RecommendationEntity recommendationEntity;
  const _HorizontalCard({required this.recommendationEntity});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.push(
        context,
        Routes.destinationScreen,
        recommendationEntity,
      ),
      child: Container(
        width: 220,

        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withValues(alpha: 0.2),
              blurRadius: 4,

              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(9),
              clipBehavior: Clip.antiAlias,

              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(Assets.des1, fit: BoxFit.cover),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        recommendationEntity.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.details.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.star,
                              size: 20,
                              color: AppColors.darkYellowColor,
                            ),
                          ),
                          TextSpan(
                            text: recommendationEntity.rating.toString(),
                            style: TextStyles.details.copyWith(
                              color: AppColors.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      recommendationEntity.location ?? "",
                      style: TextStyles.details.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalTourCard extends StatelessWidget {
  final RecommendationEntity recommendationEntity;
  const _VerticalTourCard({required this.recommendationEntity});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.push(
        context,
        Routes.destinationScreen,
        recommendationEntity,
      ),
      child: Container(
        height: 110,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(Assets.des1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Full Day Tour",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.greyColor,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.star,
                                  size: 20,
                                  color: AppColors.darkYellowColor,
                                ),
                              ),
                              TextSpan(
                                text: recommendationEntity.rating.toString(),
                                style: TextStyles.details.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(5),
                    Text(
                      recommendationEntity.title ?? "",
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gap(5),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "from ",
                            style: TextStyles.details.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text: recommendationEntity.price?.formatted,
                            style: TextStyles.details.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " Per Person",

                            style: TextStyles.details.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

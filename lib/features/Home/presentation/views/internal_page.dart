import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_safarni_team3/core/constants/routes.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_safarni_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/domain/entities/recommendation_entity.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/presentation/cubit/home_cubit/home_states.dart';
import 'package:round_8_mobile_safarni_team3/generated/assets.dart';

class InternalPage extends StatelessWidget {
  const InternalPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: CustomAppBar(title: ""),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextForm(
                controller: cubit.searchController,
                hint: "paris",
                prefix: Icon(Icons.search),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    cubit.getHome();
                  } else {
                    cubit.clearSearch();
                  }
                },
              ),
              Gap(30),
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  if (state is HomeSuccessState) {
                    if (cubit.searchResultList.isEmpty) {
                      return Center(child: Text("No places in this city"));
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: cubit.searchResultList.length,
                          itemBuilder: (context, i) {
                            return SearchCard(
                              recommendationEntity: cubit.searchResultList[i],
                            );
                          },
                        ),
                      );
                    }
                  } else if (state is HomeLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeFailureState) {
                    return Center(child: Text(state.message));
                  } else {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Search for Tours ",
                                style: TextStyles.header.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Icon(Icons.search),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  final RecommendationEntity recommendationEntity;
  const SearchCard({super.key, required this.recommendationEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(
          context,
          Routes.destinationScreen,
          recommendationEntity,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: Offset(2, 2),
              spreadRadius: 1,
            ),
          ],
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.des1,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Text(
                    "Full Day Tour",
                    style: TextStyles.details.copyWith(fontSize: 12),
                  ),
                  Gap(5),
                  Text(
                    recommendationEntity.title ?? "",
                    maxLines: 1,
                    style: TextStyles.details.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  Gap(5),
                  Text(
                    "From ${recommendationEntity.price!.formatted} Per Person",
                    maxLines: 1,
                    style: TextStyles.details.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),

            Icon(Icons.star, color: Colors.amber),
            Text("4.5"),
            Gap(5),
          ],
        ),
      ),
    );
  }
}

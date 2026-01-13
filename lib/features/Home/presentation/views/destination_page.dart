import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/core/widgets/custom_button.dart';
import 'package:safarni/features/Home/domain/entities/recommendation_entity.dart';
import 'package:safarni/features/Home/presentation/widgets/destination_widgets/custom_sliver_app_bar_home.dart';
import 'package:safarni/features/Home/presentation/widgets/destination_widgets/home_buttom_navigation_bar.dart';
import 'package:safarni/features/Home/presentation/widgets/destination_widgets/review_card_widget.dart';
import 'package:safarni/features/Home/presentation/widgets/destination_widgets/title_widget.dart';
import 'package:safarni/features/Home/presentation/widgets/destination_widgets/top_activaites_card_widget.dart';
import 'package:safarni/generated/assets.dart';

class DestinationPage extends StatelessWidget {
  final RecommendationEntity recommendationEntity;
  const DestinationPage({super.key, required this.recommendationEntity});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: DestinationBody(recommendationEntity: recommendationEntity),
        bottomNavigationBar: HomeButtonNavigationBar(),
      ),
    );
  }
}

class DestinationBody extends StatefulWidget {
  final RecommendationEntity recommendationEntity;
  const DestinationBody({super.key, required this.recommendationEntity});
  @override
  State<DestinationBody> createState() => _DestinationBodyState();
}

class _DestinationBodyState extends State<DestinationBody> {
  final List<String> images = [
    Assets.des1,
    Assets.des2,
    Assets.des3,
    Assets.des4,
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBarHome(images: images),

        /// ---------- BODY ----------
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.recommendationEntity.slug ?? "",
                      style: TextStyles.details.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    FivePointedStar(
                      size: Size(20, 20),
                      gap: 1,
                      color: Colors.grey[300]!,
                      selectedColor: Colors.amber,
                      defaultSelectedCount: 3,
                      disabled: true,
                      count: 5,
                      onChange: (selectedCount) {},
                    ),
                    Gap(5),
                    Text(
                      widget.recommendationEntity.rating.toString(),
                      style: TextStyles.details.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "(455)",
                      style: TextStyles.details.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  widget.recommendationEntity.title ?? "",
                  style: TextStyles.details.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                Gap(8),
                Text(
                  "5 Days and 4 Night ",
                  style: TextStyles.details.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(8),

                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    Gap(4),

                    Text(
                      widget.recommendationEntity.location ?? "",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const Gap(16),

                TitleWidget(text: 'Top Activities'),

                const Gap(8),

                LimitedBox(
                  maxHeight: 180,

                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TopActivaitesCardWidget(
                        image: Assets.des2,
                        text: "SunSet Bike Ride",
                      ),
                      TopActivaitesCardWidget(
                        image: Assets.des3,

                        text: "SunSet Bike Ride",
                      ),
                      TopActivaitesCardWidget(
                        image: Assets.des4,

                        text: "SunSet Bike Ride",
                      ),
                    ],
                  ),
                ),
                TitleWidget(text: "Best Time to Visit"),
                const Gap(10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.greyColor.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Text(
                    "Spring (April-June) and fall (September-October) offer pleasant weather and fewer crowds, ideal for exploring the city's attractions.",
                    style: TextStyles.details.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                const Gap(10),

                Row(
                  children: [
                    TitleWidget(text: "Gallery"),
                    Text("(200)"),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "see more",
                        style: TextStyles.details.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                GridView(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  semanticChildCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 120,
                  ),
                  children: List.generate(4, (i) {
                    return Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[i]),
                        ),
                      ),
                    );
                  }),
                ),
                Gap(10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_enhance_outlined,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      " add Photo",
                      style: TextStyles.details.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                Gap(10),

                TitleWidget(text: "Reviews"),
                Gap(10),

                ReviewCardWidget(
                  image: Assets.man1,
                  details:
                      "Such a dreamy place! The views were stunning, and the atmosphere was so romantic. It felt like a fairytale moment in the heart of Paris.",
                  name: "Dale Thiel",
                  stars: 4,
                  time: "6 month Ago",
                ),
                Gap(15),
                ReviewCardWidget(
                  image: Assets.man2,

                  details:
                      "Such a dreamy place! The views were stunning, and the atmosphere was so romantic. It felt like a fairytale moment in the heart of Paris.",
                  name: "Dale Thiel",
                  stars: 4,
                  time: "6 month Ago",
                ),

                Gap(20),
                CustomButton(
                  title: "See More",
                  onPressed: () {},
                  textColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  backgroundColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

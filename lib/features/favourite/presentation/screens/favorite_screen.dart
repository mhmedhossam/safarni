import 'package:flutter/material.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/core/widgets/custom_appbar.dart';
import 'package:safarni/features/Home/data/model/recommendation_model.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/constants/routes.dart';
import '../widgets/favorite_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        widget: Center(child: Text("Favourite", style: TextStyles.title)),
        showBack: false,
        isCenterWidget: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigation.push(
                  context,
                  Routes.destinationScreen,
                  RecommendationModel(
                    id: 1,
                    title: "Eiffel Tower",
                    thumbnail: "Full Day",
                    rating: 5,
                    location: "egypt",
                    slug: "full Day",
                  ),
                );
              },
              child: FavoriteCard(),
            );
          },
        ),
      ),
    );
  }
}

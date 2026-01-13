// Recommended Hotel Card (Horizontal)
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:round_8_mobile_safarni_team3/generated/assets.dart';

class RecommendedHotelCard extends StatelessWidget {
  final VoidCallback onTap;
  final HotelsModels hotel;
  const RecommendedHotelCard({
    super.key,
    required this.onTap,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16, bottom: 2, top: 2, left: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: Image.asset(
                  Assets.des5,
                  // hotel.mainImage.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
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
                              "${hotel.discount}% off",
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
                        hotel.rating.toString(),
                        style: TextStyles.details.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hotel.name.toString(),
                    style: TextStyles.title.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111928),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/Location.svg"),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          hotel.address.toString(),
                          style: TextStyles.details.copyWith(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

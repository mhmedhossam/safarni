// Nearby Hotel Card (Vertical)
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/generated/assets.dart';

class NearbyHotelCard extends StatelessWidget {
  final VoidCallback onTap;
  final HotelsModels hotel;
  const NearbyHotelCard({super.key, required this.onTap, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 16),
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: Image.asset(
                  Assets.des3,
                  // hotel.mainImage!,
                  fit: BoxFit.fill,
                ), // Image.asset("assets/images/hotal.png", fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Gap(  4),
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

                        const Gap(4),
                        Text(
                          hotel.rating.toString(),
                          style: TextStyles.details.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    Expanded(child: const Gap(4)),
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
                    Expanded(child: const Gap(4)),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/Location.svg"),
                        const Gap(8),
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
                    //  const Gap(  8),
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/Hotal_Booking/data/model/Roos/rooms_models.dart';

class RoomCard extends StatelessWidget {
  final VoidCallback onTap;
  final RoomsModels room;
  const RoomCard({super.key, required this.onTap, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: room.mainImage != null
                  ? Image.network(room.mainImage.toString(), fit: BoxFit.fill)
                  : Container(
                      height: 140,
                      alignment: Alignment.center,
                      color:
                          Colors.grey[200], // Optional: Set a background color
                      child: Center(
                        child: Icon(
                          Icons
                              .bed_outlined, // Icon to display when image is null
                          size: 50, // You can adjust the size as needed
                          color: Colors
                              .black, // Optional: Change color of the icon
                        ),
                      ),
                    ), //room.mainImage==null?Icon(Icons.bed_outlined): Image.network(room.mainImage.toString(), fit: BoxFit.fill),
            ),
            Expanded(child: Gap(4)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.name.toString(),
                    style: TextStyles.details.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111928),
                    ),
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Text(
                        'From',
                        style: TextStyles.details.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        ' ${room.pricePerNight.toString()}\$',
                        style: TextStyles.details.copyWith(
                          fontSize: 12,
                          color: Color(0xFF1E88E5),
                        ),
                      ),
                      Text(
                        ' Per Night',
                        style: TextStyles.details.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

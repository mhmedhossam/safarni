import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safarni/core/constants/routes.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/Hotal_Booking/presentation/manager/ReviewCubit/review_room_cubit.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Reviews',
              style: TextStyles.details.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111928),
              ),
            ),

            Spacer(),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(Routes.reviewScreen);
              },
              icon: Icon(Icons.rate_review, color: Color(0xFF1E429F)),
            ),
            Text(
              'add Review',
              style: TextStyles.details.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E429F),
              ),
            ),
          ],
        ),

        BlocBuilder<ReviewRoomCubit, ReviewRoomState>(
          builder: (context, state) {
            if (state is ReviewRoomFailure) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state is ReviewRoomSuccess) {
              final reviews = state.review;
              if (reviews.isEmpty) {
                return Center(child: Text('No reviews available.'));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.user!.name!,
                                    style: TextStyles.details.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF111928),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              review.createdAt?.day.toString() ?? "0",
                              style: TextStyles.details.copyWith(
                                fontSize: 13,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                          ],
                        ),
                        const Gap(4),
                        Row(
                          children: List.generate(
                            review.rating!,
                            (index) => const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const Gap(8),

                        Text(
                          review.comment!,
                          style: TextStyles.details.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/features/Hotal_Booking/presentation/View/Rooms_Details_View.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/text_styles.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({super.key});

  @override
  State<ReviewView> createState() => ReviewViewState();
}

class ReviewViewState extends State<ReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // صورة الفندق العلوية
          CustomSliverAppBar(heigthmodels: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                        child: Row(children: [Text("10%off")]),
                      ),
                      Spacer(),
                      const Icon(Icons.star, size: 14, color: Colors.amber),

                      const SizedBox(width: 4),
                      Text('4.5', style: TextStyles.details),
                      Text('(356 reviews)', style: TextStyles.details),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "HarborHaven HIdeaway",
                    style: TextStyles.details.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111928),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    r'1012 oscean avanue, New Yourk ,USA',
                    style: TextStyles.details.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,

                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),

                  const Divider(),
                  SizedBox(height: 16),

                  Center(
                    child: Text(
                      r'Your Over Rating Of This Product',
                      style: TextStyles.details.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,

                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 35,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  //Add detailed review
                  Text(
                    'Add detailed review ',
                    style: TextStyles.details.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,

                      color: Color(0xFF111928),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(12),
                    height: 150,
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
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write your review here...',
                        hintStyle: TextStyles.details.copyWith(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 110,

        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SizedBox()),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E429F),
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyles.details.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

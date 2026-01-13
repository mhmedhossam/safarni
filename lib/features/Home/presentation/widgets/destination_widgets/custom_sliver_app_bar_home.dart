import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_safarni_team3/core/utils/app_colors.dart';

class CustomSliverAppBarHome extends StatefulWidget {
  final List<String> images;
  const CustomSliverAppBarHome({super.key, required this.images});

  @override
  State<CustomSliverAppBarHome> createState() => _CustomSliverAppBarHomeState();
}

class _CustomSliverAppBarHomeState extends State<CustomSliverAppBarHome> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      stretch: true,

      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(10),
          CircleAvatar(
            maxRadius: 20,
            backgroundColor: AppColors.whiteColor,
            child: const BackButton(color: AppColors.blackColor),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          maxRadius: 20,

          backgroundColor: AppColors.whiteColor,
          child: IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.blackColor,
            ),
            onPressed: () {},
          ),
        ),
        Gap(10),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              /// PageView
              PageView.builder(
                clipBehavior: Clip.antiAlias,

                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(widget.images[index], fit: BoxFit.cover);
                },
              ),

              /// Image index
              Positioned(
                bottom: 16,

                right: width / 2.5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.image, size: 20),
                      Gap(2),
                      Text(
                        '${currentIndex + 1}/${widget.images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

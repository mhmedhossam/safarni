import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:safarni/generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  // تعريف الـ Controller كـ late
  late CircularBottomNavigationController _navigationController;

  // قائمة الصفحات للتنقل بينها
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _navigationController = CircularBottomNavigationController(selectedPos);

    _pages = [
      const HomeBody(),
      const Center(
        child: Text("Favorite Page", style: TextStyle(fontSize: 24)),
      ),
      const Center(child: Text("Compare Page", style: TextStyle(fontSize: 24))),
      const Center(child: Text("Maps Page", style: TextStyle(fontSize: 24))),
    ];
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = List.of([
      TabItem(
        Icons.home,
        "Home",
        Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TabItem(
        Icons.favorite,
        "Favorite",
        Colors.red,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TabItem(
        Icons.compare_arrows,
        "Compare",
        Colors.orange,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      TabItem(
        Icons.map,
        "Maps",
        Colors.green,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ]);

    return Scaffold(
      body: Stack(
        children: [
          _pages[selectedPos],

          Align(
            alignment: Alignment.bottomCenter,
            child: CircularBottomNavigation(
              tabItems,
              controller: _navigationController,
              selectedPos: selectedPos,
              barHeight: bottomNavBarHeight,
              barBackgroundColor: Colors.white,
              backgroundBoxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10.0),
              ],
              animationDuration: const Duration(milliseconds: 300),
              selectedCallback: (int? pos) {
                if (pos != null) {
                  setState(() {
                    selectedPos = pos;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  final List<String> images = const [
    Assets.des1,
    Assets.des2,
    Assets.des3,
    Assets.des4,
    Assets.des5,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Explore The Best Places In World!'),
                trailing: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/icons/Avatar.svg'),
                ),
              ),
              const Gap(20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search  ...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Gap(25),

              const Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Gap(15),

              // Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(image: images[0], label: "Flight"),
                  CategoryItem(image: images[1], label: "Cars"),
                  CategoryItem(image: images[2], label: "Tours"),
                  CategoryItem(image: images[3], label: "Hotels"),
                ],
              ),
              const Gap(30),

              _buildHeader("Recommendations"),
              const Gap(15),

              // Horizontal List
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => const HorizontalCard(),
                ),
              ),
              const Gap(30),

              _buildHeader("Available Tours"),
              const Gap(15),

              // Vertical List - الجزء الذي يسبب مشاكل عادةً
              ListView.builder(
                shrinkWrap: true, // مهم جداً
                physics:
                    const NeverScrollableScrollPhysics(), // منع التضارب مع السكرول الرئيسي
                itemCount: 6,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => const VerticalTourCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
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

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.blue[50],
          child: ClipOval(
            // ✅ الحل
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover, // ✅ تملى الدايرة صح
            ),
          ),
        ),
        const Gap(8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(Assets.des2),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class VerticalTourCard extends StatelessWidget {
  const VerticalTourCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              image: const DecorationImage(
                image: AssetImage(Assets.des1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Beautiful Destination",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Egypt, Giza",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

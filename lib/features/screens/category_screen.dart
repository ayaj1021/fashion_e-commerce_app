import 'package:fashion_ecommerce_app/features/core/widgets/category_container_widget.dart';
import 'package:fashion_ecommerce_app/features/screens/pages/home_screen.dart';
import 'package:fashion_ecommerce_app/features/screens/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomnavScreen extends StatefulWidget {
  const BottomnavScreen({
    super.key,
  });

  @override
  State<BottomnavScreen> createState() => _BottomnavScreenState();
}

class _BottomnavScreenState extends State<BottomnavScreen> {
  int currentPage = 0;

  List pages = [
    const HomeScreen(),
    const Center(
      child: Text('Shopping page'),
    ),
    const Center(
      child: Text('Notification page'),
    ),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          currentIndex: currentPage,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Shopping cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'),
          ]),
      body: SafeArea(child: pages[currentPage]),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text(
            'Categories',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const CategoryContainerWidget(
            icon: Icons.shopping_cart_outlined,
            titleText: 'New Arrivals',
            productNo: '208 products',
          ),
          const SizedBox(height: 15),
          const CategoryContainerWidget(
            icon: Icons.shopping_bag_outlined,
            titleText: 'Bag',
            productNo: '160 products',
          ),
          const SizedBox(height: 15),
          const CategoryContainerWidget(
            icon: Icons.phone_iphone_rounded,
            titleText: 'Phones',
            productNo: '100 products',
          ),
        ],
      ),
    );
  }
}

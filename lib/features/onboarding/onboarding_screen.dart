import 'package:fashion_ecommerce_app/features/authentication/auth_screens/first_auth_page.dart';
import 'package:fashion_ecommerce_app/features/onboarding/onboarding_pages/first_onboard_page.dart';
import 'package:fashion_ecommerce_app/features/onboarding/onboarding_pages/second_onboard_page.dart';
import 'package:fashion_ecommerce_app/features/onboarding/onboarding_pages/third_onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  FirstOnboardPage(),
                  SecondOnboardPage(),
                  ThirdOnboardPage(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                ),
                GestureDetector(
                  onTap: () {
                    if (currentPage <= 3 && currentPage == 0) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstAuthPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

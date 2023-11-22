import 'package:fashion_ecommerce_app/features/authentication/auth_screens/first_auth_page.dart';
import 'package:fashion_ecommerce_app/features/onboarding/model/onboard_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
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
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: contents.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            contents[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          contents[index].titleText,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[index].subtitleText,
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: contents.length,
                    effect:
                        const ExpandingDotsEffect(activeDotColor: Colors.black,),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentPage == contents.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstAuthPage(),
                          ),
                        );
                      }
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut);
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
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 60,
            //     width: double.infinity,
            //     margin:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            //     decoration: BoxDecoration(
            //       color: Colors.black,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Text(
            //       'Next',
            //       style: GoogleFonts.poppins(
            //         color: Colors.white,
            //         fontSize: 14,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

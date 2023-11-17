import 'package:fashion_ecommerce_app/features/authentication/auth_screens/login_screen.dart';
import 'package:fashion_ecommerce_app/features/authentication/auth_screens/signup_screen.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/long_button_widget.dart';
import 'package:flutter/material.dart';

class FirstAuthPage extends StatelessWidget {
  const FirstAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/onboard_image1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 25,
            right: 5,
            left: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const LongButtonContainer(
                      buttonName: 'Login',
                      buttonColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen(),),);
                    },
                    child: LongButtonContainer(
                      buttonName: 'Sign up',
                      buttonTextColor: Colors.white,
                      buttonBorder: (Border.all(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
